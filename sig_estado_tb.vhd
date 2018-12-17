library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sig_estado_tb is
end sig_estado_tb;

architecture Behavioral of sig_estado_tb is
    component siguiente_estado is
        PORT(
            clk,reset: IN STD_LOGIC;
            piso_deseado, piso_actual: IN NATURAL RANGE 0 TO 3;
            puerta: OUT STD_LOGIC;
            motor: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    end component;

    signal clk_tb, reset_tb: std_logic :='0';
    signal piso_deseado_tb, piso_actual_tb: natural range 0 to 3 :=0;
    signal puerta_tb: std_logic;
    signal motor_tb: std_logic_vector(1 downto 0);

begin
    sig_est_tb: siguiente_estado port map(clk=> clk_tb, reset=> reset_tb,
            piso_deseado=> piso_deseado_tb, piso_actual=> piso_actual_tb,
            puerta=> puerta_tb, motor=> motor_tb);

    process
    begin
        wait for 50 ns;
        clk_tb<= not clk_tb;
    end process;
    
    reset_tb<= '1' after 25 ns, '0' after 50 ns;
    
    process
    begin
        piso_deseado_tb<=1;
        piso_actual_tb<=1;
        wait for 200 ns;
        
        piso_deseado_tb<=3;
        piso_actual_tb<=1;
        wait for 100 ns;
        
        piso_deseado_tb<=0; --tendria que seguir subiendo
        wait for 100 ns;

        piso_actual_tb<=3;
        wait for 200 ns;
        
        piso_deseado_tb<=2;
        wait for 200 ns;
        piso_actual_tb<=2;
        wait for 200 ns;
        
        ASSERT FALSE
        REPORT "simulación terminada"
        SEVERITY FAILURE;
    end process;
end Behavioral;
