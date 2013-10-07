library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package pkg_disr is 

----------------------------GENERAL SETUP---------------------------
constant PKT_TYPE 				: integer 	:= 5;
constant SRC_ID					: integer	:= 100; 
constant DIRECTIONS	        		: integer	:= 5;			--id node
constant SEG_ID_NODE				: integer	:= SRC_ID;		--srcid.segid
constant SEG_ID_LINK				: integer	:= SRC_ID+DIRECTIONS;	--srcid.segid
constant TTL					: integer	:= 126;			--hops max
					
constant CTRL_DIM				: integer	:= 4;			--control_words
------------------------------PKT TYPE------------------------------
constant STARTING_SEGMENT_REQUEST		: integer 	:=0; 
constant SEGMENT_REQUEST 			: integer 	:=1;
constant STARTING_SEGMENT_CONFIRM 		: integer 	:=2;
constant SEGMENT_CONFIRM 			: integer 	:=3; 
constant SEGMENT_CANCEL 			: integer 	:=4;
------------------------------DIRECTION------------------------------ 
constant DIRECTION_LOCAL			: integer	:=1; --direction local code
constant DIRECTION_NORTH			: integer	:=2; --direction local code
------------------------------FREE LINK -----------------------------

constant CYCLE_TIMEOUT				: integer	:=DIRECTIONS+1; 
constant NO_LINK				: integer	:=DIRECTIONS+1; --direction local code
constant FL_MSG					: integer	:=NO_LINK+1; --direction local code
------------------------------OUT_CODE-------------------------------
constant DIR_OUT				: integer	:=0;
constant ACTION_CONFIRM				: integer	:=DIRECTIONS;
constant ACTION_DISCARD				: integer	:=ACTION_CONFIRM+1;
constant ACTION_FLOOD				: integer	:=ACTION_DISCARD+1;
constant ACTION_CANCEL_REQUEST 			: integer	:=ACTION_FLOOD+1;
constant ACTION_SKIP				: integer	:=ACTION_CANCEL_REQUEST+1;
constant ACTION_END_CONFIRM                     : integer	:=ACTION_SKIP+1;

constant NUM_OUTCODE_BIT			: integer	:=ACTION_END_CONFIRM+1;
-----------------------------SEGMENT_ID_STATUS-------------------------------
constant NOT_VALID				: integer	:=0;
constant NOT_RESERVED				: integer	:=1;
--ID > 1 IS THE REAL SEGMENT ID

------------------------------DISR_STATUS(DBS)-------------------------------
constant BOOTSTRAP				: integer	:=0;
constant ACTIVE_SEARCHING			: integer	:=1;
constant CANDIDATE				: integer	:=2;
constant CANDIDATE_STARTING			: integer	:=3;
constant ASSIGNED				: integer	:=4;
constant FREE 					: integer	:=5;

--Sgment ID data structure
type segID   
  is record
     node : integer range 0 to SRC_ID;
     link : integer range 0 to DIRECTIONS-2;
  end record;

type segIDs is  array(natural range <>) of segID; 

end pkg_disr;
--------------------------------------------BODY---------------------------------
package body pkg_disr is
end pkg_disr;
