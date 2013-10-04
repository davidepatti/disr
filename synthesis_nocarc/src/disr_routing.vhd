library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.pkg_disr.all;

entity disr is 
	port (	pkt_type  			:  in 	integer range 0 to PKT_TYPE;
			pkt_dir_in			:  in 	integer range 0 to DIRECTIONS-1;
			pkt_src   			:  in 	integer range 0 to SRC_ID;
			--Pkt segId
			pkt_segid_node		:  in 	integer range 0 to SRC_ID;
			pkt_segid_link		:  in 	integer range 0 to DIRECTIONS-2;
			--ttl				:  in 	integer range 0 to TTL;
			
			ctrl_out 			:  out 	integer range 0 to NUM_OUTCODE_BIT;
			
			--next_free_link()
			free_link_results	:  in 	integer range 0 to FL_MSG;  --destination from free_link
			free_link_access	:  out  std_logic		    --start free_link circuitry
	);

end disr;
-------------------------------------------------------------------------------
architecture behavioural of disr is

signal local_id 		: integer range 0 to SRC_ID; -- the own node's id

--LED signals--
signal segment_id_node : integer range 0 to SRC_ID;
signal segment_id_link : integer range 0 to DIRECTIONS-2;


signal visited			: std_logic;
signal tvisited			: std_logic;

signal link_visited_link  	: link_visited_link_array(DIRECTIONS-2 downto 0);
signal link_tvisited_link	: link_visited_link_array(DIRECTIONS-2 downto 0);

signal link_visited_node  	: link_visited_node_array(DIRECTIONS-2 downto 0);
signal link_tvisited_node	: link_visited_node_array(DIRECTIONS-2 downto 0);


signal starting			: std_logic;
--DSB signals--
signal dbs		: integer range 0 to 5;


begin  

proc:	process(pkt_type,pkt_src,pkt_segid_node,pkt_segid_link)
	begin
		if (pkt_type=STARTING_SEGMENT_REQUEST) then
			if (pkt_src=local_id) AND (pkt_dir_in=DIRECTION_LOCAL) then
				ctrl_out<=DIR_OUT;
 			
			elsif (pkt_src=local_id) AND (pkt_dir_in/=DIRECTION_LOCAL) then
 				if (segment_id_node/=0 and segment_id_link/=0) then

					for i in 0 to DIRECTIONS-2
					loop
						if (link_tvisited_node(i)=pkt_segid_node and 
							link_tvisited_link(i)=pkt_segid_link ) then

							segment_id_node	 <= pkt_segid_node;
							segment_id_link	 <= pkt_segid_link;
							link_tvisited_node(pkt_dir_in)<=0;
							link_visited_node(pkt_dir_in)<= pkt_segid_link;
							ctrl_out<=ACTION_CONFIRM;
						end if;
					end loop;

					ctrl_out<=ACTION_DISCARD;

				else	
					ctrl_out<=ACTION_DISCARD;
				end if;
			
			elsif (pkt_src/=DIRECTION_LOCAL)  then
				if dbs=FREE then 
					segment_id_node	 <= pkt_segid_node;
					segment_id_link	 <= pkt_segid_link;
					link_tvisited_link(pkt_segid_link)<=pkt_segid_link;	
					ctrl_out<=ACTION_FLOOD;

				elsif dbs=CANDIDATE_STARTING then 
					if (segment_id_link<pkt_segid_link) then 

						for i in 0 to DIRECTIONS-2
						loop
							if (link_tvisited_link(i)/=0 and link_visited_link(i)/=0 and
								link_tvisited_node(i)/=0 and link_visited_node(i)/=0) then
								
								link_tvisited_node(i)<=0;
								link_tvisited_node(i)<=0;
							end if;
						end loop;
					segment_id_node<=pkt_segid_node;
					segment_id_link<=pkt_segid_link;
					tvisited<='1';
					link_visited_node(pkt_dir_in)<=pkt_segid_node;
					dbs<=CANDIDATE_STARTING;
					ctrl_out<=ACTION_DISCARD;
					end if;
				end if;
			else 
			ctrl_out<=ACTION_DISCARD;	
			end if;
------------------------------------------------------------------------------------------------		
		elsif (pkt_type=SEGMENT_REQUEST) then
			if (pkt_dir_in=DIRECTION_LOCAL) then 
				ctrl_out<=DIR_OUT;
			
			elsif (pkt_src=local_id) then 

				if (dbs=FREE) then 
				link_tvisited_node(pkt_dir_in)<=0;
				link_visited_link (pkt_dir_in)<= pkt_segid_link;

				--next free_link()
					if (free_link_results>0 and free_link_results<DIRECTION_LOCAL) then 
						segment_id_node<=pkt_segid_node;
						segment_id_link<=pkt_segid_link;
						tvisited<='1';
						visited <='0';
						link_tvisited_node(free_link_results)<=pkt_segid_node;
						--set request path?????
						dbs<=CANDIDATE;
						ctrl_out<=free_link_results;
					elsif (free_link_results=CYCLE_TIMEOUT) then
						--free_direction(p.dir_in); ??
		    				--generate_segment_cancel(p); ??
							
		  				ctrl_out<= ACTION_CANCEL_REQUEST;
					elsif (free_link_results<=NO_LINK) then 
						--generate_segment_cancel(p); ??
						ctrl_out<= ACTION_SKIP;
					end if;
				elsif (dbs=CANDIDATE) then 
					if (segment_id_node=pkt_segid_node and 
					    segment_id_link=pkt_segid_link) 	then 
					--free_direction(p.dir_in);
					--generate_segment_cancel(p);
					    ctrl_out<=ACTION_CANCEL_REQUEST;

					else 
						if (pkt_dir_in<=2) then  --SHOULD BE REQUEST PATH
							for i in 0 to DIRECTIONS-2
							loop

								if (link_tvisited_link(i)/=0 and link_visited_link(i)/=0 and
								link_tvisited_node(i)/=0 and link_visited_node(i)/=0) then
								
								link_tvisited_link(i)<=0;
								link_tvisited_node(i)<=0; --NOT RESERVED
								link_visited_link(i)<=0;
								link_visited_node(i)<=0; --NOT RESERVED
								end if;
							end loop;
							link_visited_link(pkt_dir_in)<=0;
							link_tvisited_link(pkt_dir_in)<=pkt_dir_in;
						end if;
					end if;	

				end if;
			end if;
------------------------------------------------------------------------------------------------		
--		elsif (pkt_in(FLIT_SIZE-1 downto FLIT_SIZE-4))=STARTING_SEGMENT_CONFIRM) then

--		elsif (pkt_in(FLIT_SIZE-1 downto FLIT_SIZE-4))=SEGMENT_CONFIRM) then	

--		elsif (pkt_in(FLIT_SIZE-1 downto FLIT_SIZE-4))=SEGMENT_CANCEL) then	
	
		end if;
	end process;
end behavioural;

