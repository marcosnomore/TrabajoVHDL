library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ascensor_tb is
end Ascensor_tb;

architecture Behavioral of Ascensor_tb is
    COMPONENT Ascen IS
       Port (
           botones: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           sensores: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           clock,reset: IN STD_LOGIC;
           puerta: OUT STD_LOGIC;
           leds: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
           motor:OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
      );
    END COMPONENT;
    
    SIGNAL botones_tb: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL sensores_tb: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
    SIGNAL clock_tb,reset_tb: STD_LOGIC:='0';
    SIGNAL puerta_tb: STD_LOGIC;
    SIGNAL leds_tb: STD_LOGIC_VECTOR (6 DOWNTO 0);
    SIGNAL motor_tb: STD_LOGIC_VECTOR(1 DOWNTO 0);
    
    
begin
    uut: Ascen PORT MAP(
        botones=>botones_tb,
        sensores=>sensores_tb,
        clock=>clock_tb,
        reset=>reset_tb,
        puerta=>puerta_tb,
        leds=>leds_tb,
        motor=>motor_tb
    );
   
   reset_tb<='1' after 50 ns, '0' after 150 ns;
   
   process
    begin
        wait for 40 ns;
        clock_tb<= not clock_tb;
   end process;
   
   process
    begin
        wait for 100 ns;
        botones_tb<="0001";
        
        wait for 200 ns;
        sensores_tb<="0001";
        
        wait for 200 ns;    
        botones_tb<="0100";
        
        wait for 200 ns;
        sensores_tb<="0100";
        
        wait for 200 ns;    
        botones_tb<="0100"; --No cambia de estado
        
        wait for 200 ns;    
        botones_tb<="0010";
        wait for 75 ns;    
        botones_tb<="1000";
        
        wait for 200 ns;
        sensores_tb<="0010";
                
        ASSERT FALSE
        REPORT "simulaci�n terminada"
        SEVERITY FAILURE;             
     
   end process;
end Behavioral;
