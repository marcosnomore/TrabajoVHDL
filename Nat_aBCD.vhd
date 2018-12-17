library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nat_aBCD is
    Port (
            nat: in NATURAL RANGE 0 to 3;
            led: out STD_LOGIC_VECTOR (6 DOWNTO 0)
          );
end Nat_aBCD;

architecture Dataflow of Nat_aBCD is
begin
    WITH nat SELECT
        led<= "0000001" WHEN 0,
                "1001111" WHEN 1,
                "0010010" WHEN 2,
                "0000110" WHEN 3,
                "1111110" WHEN OTHERS;
end Dataflow;
