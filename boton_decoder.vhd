library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity b_decoder is
    Port(
        piso0, piso1, piso2, piso3: IN STD_LOGIC;
        p_sig: OUT NATURAL RANGE 0 TO 3
    );
end b_decoder;

architecture Dataflow of b_decoder is
    SIGNAL aux: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL p_sig_aux: NATURAL RANGE 0 TO 3;

begin
    aux<=piso0 & piso1 & piso2 & piso3;
    
    WITH aux SELECT
        p_sig_aux<= 3 WHEN "0001",
                    2 WHEN "0010",
                    1 WHEN "0100",
                    0 WHEN "1000",
                    p_sig_aux WHEN OTHERS;
    
    p_sig<=p_sig_aux;
end Dataflow;
