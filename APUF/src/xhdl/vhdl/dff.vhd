library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.parameters.all;

library UNISIM;
use UNISIM.vcomponents.all;
        
entity dff is
    port ( id : in STD_LOGIC;
           iclk : in STD_LOGIC;
           oq : out STD_LOGIC);
end dff;

architecture rtl of dff is

begin
    
    dff_generic: if C_DFF_TYPE = "GENERIC" generate    
        dff:process(iclk)
        begin
            if rising_edge (iclk) then
                oq <= id;
            end if;
        end process;
    end generate;
    
    
    dff_primitive: if C_DFF_TYPE = "PRIMITIVE" generate
       dff_inst : FDRE
       generic map (
          INIT => '0') -- Initial value of register ('0' or '1')  
       port map (
          Q => oq,      -- Data output
          C => iclk,      -- Clock input
          CE => '1',    -- Clock enable input
          R => '0',      -- Synchronous reset input
          D => id       -- Data input
       );
    end generate;

end rtl;
