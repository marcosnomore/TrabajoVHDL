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
begin
    aux<=piso3 & piso2 & piso1 & piso0;
    WITH aux SELECT
        p_sig<= 0 WHEN "0001",
                1 WHEN "0010",
                2 WHEN "0100",
                3 WHEN "1000",
                0 WHEN OTHERS;

end Dataflow;
