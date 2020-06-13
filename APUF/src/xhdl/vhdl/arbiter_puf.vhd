library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.parameters.all;

entity arbiter_puf is
    port (
        ipulse : in std_logic;
        ichallenge : in std_logic_vector(C_LENGTH - 1 downto 0);
        oresponse : out std_logic    
    );
end arbiter_puf;

architecture struct of arbiter_puf is

    signal odelay_line_oout_1 : sl := '0';
    signal odelay_line_oout_2 : sl := '0';


begin

    inst_delay_line: entity work.delay_line(struct)
    port map(
        ipulse => ipulse,
        ichallenge => ichallenge, 
        oout_1 => odelay_line_oout_1,
        oout_2 => odelay_line_oout_2
        
    );
    
    inst_dff: entity work.dff(rtl)
    port map(
        id      => odelay_line_oout_1, --: in STD_LOGIC;
        iclk    => odelay_line_oout_2, --: in STD_LOGIC;
        oq      => oresponse --: out STD_LOGIC
    );


end struct;
