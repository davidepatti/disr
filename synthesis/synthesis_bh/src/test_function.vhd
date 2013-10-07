library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.pkg_disr.all;

entity disr is 
	port (	a,b 	  : in std_logic; 	
 		record_id  : in  seg_ID2;
 		record_id2 : in  seg_ID2;
 		out1 : out std_logic;
		out2 : out std_logic
	);

end disr;
-------------------------------------------------------------------------------
architecture behavioural of disr is



function "<" (aa,bb:integer) return boolean is
begin
	if ((aa>bb)) then
		return true;
	else 
		return false;
	end if;
end "<";


begin  

proc:	process(record_id,record_id2)
	begin

	if (record_id<record_id2) then 
	out1<='1';
        end if;


	if (a<b) then 
	out2<='0';
        end if;

	end process;
end behavioural;

