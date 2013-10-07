library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.pkg_disr.all;

entity disr is 
	port (		local_ID     			:  in 	integer range 0 to SRC_ID;--node's ID (Vdd or Gnd)
			pkt_type  			:  in 	integer range 0 to PKT_TYPE;
			pkt_dir_in			:  in 	integer range 0 to DIRECTIONS-1;
			pkt_src   			:  in 	integer range 0 to SRC_ID;
			pkt_segID			:  in 	segID;
			ttl				:  in 	integer range 0 to TTL;
			ctrl_out 			:  out 	integer range 0 to NUM_OUTCODE_BIT
	);
end disr;
-------------------------------------------------------------------------------

architecture behavioural of disr is
--LED signals--
signal local_segID 		: segID;
signal visited			: std_logic;
signal tvisited			: std_logic;
signal link_visited 		: segIDs	  (DIRECTIONS-2 downto 0); --table for visited/tvisited
signal link_visited_flag 	: std_logic_vector(DIRECTIONS-2 downto 0); --visited=1, tvisited=0
signal request_path		: integer range 0 to DIRECTIONS-1;
--DSB signals--
signal dbs			: integer range 0 to 5;
--next_free_link signals
signal  free_link_results	: integer range 0 to FL_MSG;
signal  free_link_access	: std_logic;    --start/stop the process
--next free_link and reset_cyclelinks() shared signals
signal rs_cicle_access		: std_logic;	--start/stop the process
signal current_link 		: integer range 0 to DIRECTIONS-1;
signal cyclelinks_timeout	: integer range 0 to CYCLE_TIMEOUT;
--

signal free_direction           : integer range 0 to DIRECTIONS-1; 
----------------------------------overload operators--------------------------
function "<" (a,b:segID) return boolean is
begin
	if ((a.link<b.link) and (a.node<b.node)) then
		return true;
	else 
		return false;
	end if;
end "<";


function "=" (a,b:segID) return boolean is
begin
	if ((a.link<b.link) and (a.node<b.node)) then
		return true;
	else 
		return false;
	end if;
end "=";
------------------------------------------------------------------------------
begin  

proc:	process(local_ID,pkt_type,pkt_dir_in,pkt_segID)
	begin

		if (pkt_type=STARTING_SEGMENT_REQUEST) then
			if (pkt_src=local_ID) AND (pkt_dir_in=DIRECTION_LOCAL) then
				ctrl_out<=DIR_OUT;
 			
			elsif (pkt_src=local_ID) AND (pkt_dir_in/=DIRECTION_LOCAL) then
 				if (local_segID.node/=0) then

					for i in 0 to DIRECTIONS-2
					loop
						if ((link_visited(i)=pkt_segID) and (link_visited_flag(i)='1')) then --tvisited

							local_segID		 	<=pkt_segID;
							link_visited(pkt_dir_in) 	<=pkt_segID;
							link_visited_flag(pkt_dir_in)   <='1'; 
							ctrl_out		 	<=ACTION_CONFIRM;
						end if;
					end loop;

					ctrl_out<=ACTION_DISCARD;
				else	
					ctrl_out<=ACTION_DISCARD;
				end if;
			
			elsif (pkt_src/=DIRECTION_LOCAL)  then
				if dbs=FREE then 

					local_segID		 	<=pkt_segID;
					link_visited(pkt_dir_in) 	<=pkt_segID;
					link_visited_flag(pkt_dir_in)	<='1'; --set tvisited
					ctrl_out			<=ACTION_FLOOD;

				elsif dbs=CANDIDATE_STARTING then 
					if (local_segID<pkt_segID) then 

						for i in 0 to DIRECTIONS-2 --SET ALL NULL, tflag don't care
						loop
							link_visited(i).node<=0; 
						end loop;

					local_segID		 	<=pkt_segID;
					tvisited		 	<='1'; 
					visited			 	<='0';
					link_visited(pkt_dir_in) 	<=local_segID;
					link_visited_flag(pkt_dir_in)	<='1';
					dbs				<=CANDIDATE_STARTING;
					ctrl_out			<=ACTION_DISCARD;

					end if;
				end if;
			else 
				ctrl_out<=ACTION_DISCARD;	
			end if;
------------------------------------------------------------------------------------------------		
		elsif (pkt_type=SEGMENT_REQUEST) then
			if (pkt_dir_in=DIRECTION_LOCAL) then 
				ctrl_out<=DIR_OUT;
			
			elsif (pkt_src=local_ID) then 

				if (dbs=FREE) then 
				link_visited(pkt_dir_in).node<=0;

				--next free_link()
				---free_link_on<='1';
				
					if (free_link_results>0 and free_link_results<DIRECTION_LOCAL) then 

						local_segID.node		<=pkt_segID.node;
						local_segID.link			<=pkt_dir_in;
						tvisited			<='1';
						visited 			<='0';
						link_visited(free_link_results)	<=local_segID;
						link_visited_flag   (free_link_results)	<='0';
						
						dbs<=CANDIDATE; --STATE MACHINE OP.
						ctrl_out<=free_link_results;

					elsif (free_link_results=CYCLE_TIMEOUT) then
		  				ctrl_out<= ACTION_CANCEL_REQUEST;
					elsif (free_link_results<=NO_LINK) then 
						ctrl_out<= ACTION_SKIP;
					end if;

				elsif (dbs=CANDIDATE) then 
					if (local_segID=pkt_segID) then 
					    ctrl_out<=ACTION_CANCEL_REQUEST;
					else 
						if (pkt_dir_in<=2) then  --SHOULD BE REQUEST PATH
							
							for i in 0 to DIRECTIONS-2 --SET ALL NULL, tflag don't care
							loop
								link_visited(i).node<=0; 
								
							end loop;

							link_visited_flag(pkt_dir_in) <='0'; --it's tvisited
							link_visited(pkt_dir_in).link<=pkt_dir_in;
						end if;
					end if;	
				end if;
			end if;
------------------------------------------------------------------------------------------------		
		elsif (pkt_type=STARTING_SEGMENT_CONFIRM) then
			if (pkt_src=local_ID and pkt_dir_in= DIRECTION_LOCAL) then 
				ctrl_out<= DIR_OUT; --previously generate by segment confirm()
			elsif (pkt_src/=local_ID) then
				if (dbs=CANDIDATE_STARTING and local_segID=pkt_segID) then 

					tvisited <= '0';
					visited  <= '1';

					link_visited(pkt_dir_in) <= pkt_segID;
					link_visited_flag(pkt_dir_in) <='1'; --it's visited
					link_visited(request_path) <= pkt_segID;
					link_visited_flag(request_path) <='1'; --it's visited

					for i in 0 to DIRECTIONS-2 --SET ALL NULL, tflag don't care
					loop
						if(i/=request_path and i/=pkt_dir_in) then
							link_visited(i).node<=0; --set NULL if not request path
						end if;									
					end loop;
		    			
					dbs<=ASSIGNED;
				else
					ctrl_out<=ACTION_SKIP;
				end if;
			else
				if (pkt_src/=local_ID and pkt_dir_in/=DIRECTION_LOCAL) then 
					link_visited(pkt_dir_in)<=pkt_segID;
					link_visited_flag(pkt_dir_in) <='1'; --it's visited
				end if;

			ctrl_out<=ACTION_END_CONFIRM;	
			end if;
------------------------------------------------------------------------------------------------
		elsif (pkt_type=SEGMENT_CONFIRM) then

			if (pkt_src=local_ID and pkt_dir_in=DIRECTION_LOCAL) then 
				ctrl_out<=DIR_OUT;
			elsif (pkt_segID.node=local_ID) then 
				link_visited(pkt_dir_in)<=pkt_segID;
				link_visited_flag(pkt_dir_in)<='1'; --it's visited
				dbs<=ASSIGNED;
				ctrl_out<=ACTION_END_CONFIRM;
			elsif (dbs=CANDIDATE and local_segID=pkt_segID) then 
				dbs<=ASSIGNED;
				tvisited<='0';
				visited <='1';	
				link_visited(pkt_dir_in)	<=pkt_segID;
				link_visited_flag(pkt_dir_in)	<='1'; --it's visited (assigned)
				link_visited(request_path)	<=pkt_segID;
				link_visited_flag(request_path)	<='1'; --it's visited (assigned)
			end if;
			ctrl_out<=ACTION_SKIP;

		elsif (pkt_type=SEGMENT_CANCEL) then	
			if (pkt_src=local_ID and pkt_dir_in=DIRECTION_LOCAL) then 
				ctrl_out<=DIR_OUT;
			else
				if (ttl=0 and local_ID/=pkt_segID.node) then
							
						--free_direction(pkt_dir_in);
						--free_direction(request_path)	
						visited <='0';
						tvisited<='0';
						dbs<=FREE;
						--return (request_path)				
				end if;
			end if;
		end if;
	end process;

------------------------------------------------------------------------------------------------
--free_l: process(free_link_access) --started when free_link_acces rise up

	
--	variable found_dir 	: integer range 0 to DIRECTIONS-1:=NO_LINK; 
--	begin
--		if (free_link_access='1' and free_link_access'event) then
--			if (current_link=DIRECTION_LOCAL) then
--				current_link:= DIRECTION_NORTH;
--			end if; 
			
			
--		end if;
--	end process;

--rs_cicle: 
--	process(start)
--	begin

--		current_link<=0;
--	end process;	
end behavioural;

