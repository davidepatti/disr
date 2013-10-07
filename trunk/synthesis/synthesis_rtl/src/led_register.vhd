-------------------------------------------------------------------------------
--Author	: Andrea Mineo
--Description 	: LED register RTL implementation
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.pkg_disr.all;

entity led_registers is 
	port (	ck 		 :	in std_logic;
		rs 		 :	in std_logic;
		we		 :	in std_logic;		--write enable
		re		 :	in std_logic;		--read  enable

		--sel write      :      integer   select the adrres in wich update the link visited-p 
		link_visited_p   :	inout link_visited;	--link_visited[] array	
		seg_id 	      	 :	inout segID;		--local segID
		visited      	 :	inout std_logic;
		tvisited     	 :	inout std_logic
	);
end led_registers;
-------------------------------------------------------------------------------
architecture rtl of led_registers is

	--registers
	signal link_visited_sig : 	link_visited;
	signal seg_id_sig 	:	segID;	
	signal visited_sig      :	std_logic;
	signal tvisited_sig     :	std_logic;

begin
--write process
write_proc:
process(ck,rs,we)
begin
	if (rs='1') then  --Cancel all registers

		visited_sig	<='0';
		tvisited_sig	<='0';
		seg_id_sig.link	<=0;
		seg_id_sig.node	<=0;
		for i in 0 to DIRECTIONS-2
		loop
			link_visited_sig.tflag(i)<='0';
			link_visited_sig.segID(i).link<=0;
			link_visited_sig.segID(i).node<=0;	
		end loop;
	
	else
		if ((ck='1' and ck'event)) then
			if(we='1') then
				visited_sig	 <=visited;
				tvisited_sig	 <=tvisited;
				seg_id_sig	 <=seg_id;
				link_visited_sig <=link_visited_p;
			end if;
		end if;
	end if;

end process;

--Read process
read_proc:
process(ck,rs,re)
begin
	if (rs/='1') then 
		if (ck='1' and ck'event) then
			if (re='1') then
				visited		<=visited_sig;
				tvisited	<=tvisited_sig;
				seg_id		<=seg_id_sig;
				link_visited_p	<=link_visited_sig;
			end if;		
		end if;
	end if;
end process;
end rtl;

