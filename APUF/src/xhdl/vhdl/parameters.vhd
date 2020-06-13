library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package parameters is

    constant C_LENGTH : natural := 3; --length of the chain multiplexes
    
    constant C_DFF_TYPE : string := --"GENERIC"; --how to generate dff: using process
                                    "PRIMITIVE"; --                 using primitive  template
    
    alias sl is std_logic ;
    alias slv is std_logic_vector;
    
end package;