library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Nat_aBCD_tb is
end Nat_aBCD_tb;

architecture Behavioral of Nat_aBCD_tb is
    COMPONENT Nat_aBCD
        Port (
            nat: in NATURAL RANGE 0 to 9;
            led: out STD_LOGIC_VECTOR (6 DOWNTO 0);
            digsel: out STD_LOGIC_VECTOR (7 DOWNTO 0)
          );
    end COMPONENT;
    
    SIGNAL nat_tb: NATURAL RANGE 0 to 9;
    SIGNAL led_tb: STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL digsel_tb: STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
    uut: Nat_aBCD PORT MAP( nat=>nat_tb, led=>led_tb, digsel=>digsel_tb);
    
    PROCESS
    BEGIN
        nat_tb<=0;
        wait for 100 ns;
        nat_tb<=1;
        wait for 100 ns;
        nat_tb<=2;
        wait for 100 ns;
        nat_tb<=3;
        wait for 100 ns;
        nat_tb<=4;
        wait for 100 ns;
        nat_tb<=5;
        wait for 100 ns;
        nat_tb<=6;
        wait for 100 ns;
        nat_tb<=7;
        wait for 100 ns;
        nat_tb<=8;
        wait for 100 ns;
        nat_tb<=9;
        wait for 100 ns;
        
        ASSERT false
            REPORT "Fin de simulación."
        SEVERITY FAILURE;
    END PROCESS;
end Behavioral;
