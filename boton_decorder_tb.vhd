library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity boton_decorder_tb is
end boton_decorder_tb;

architecture Behavioral of boton_decorder_tb is
    component b_decoder is
        Port(
            piso0, piso1, piso2, piso3: IN STD_LOGIC;
            p_sig: OUT NATURAL RANGE 0 TO 3
        );
    end component;
    
    signal piso0_tb, piso1_tb, piso2_tb, piso3_tb: std_logic :='0';
    signal p_sig_tb: NATURAL RANGE 0 TO 3;

begin
    b_decoder_tb: b_decoder 
                port map (
                            piso0=> piso0_tb, 
                            piso1=> piso1_tb, 
                            piso2=> piso2_tb, 
                            piso3=> piso3_tb, 
                            p_sig=> p_sig_tb
                          );

    process
    begin 
    
        wait for 50 ns;
        piso0_tb<='1';
        wait for 50 ns;
        piso0_tb<='0';
    
        wait for 50 ns;
        piso1_tb<='1';
        wait for 50 ns;
        piso1_tb<='0';
    
        wait for 50 ns;
        piso2_tb<='1';
        wait for 50 ns;
        piso2_tb<='0';
    
        wait for 50 ns;
        piso3_tb<='1';
        wait for 50 ns;
        piso3_tb<='0';
        wait for 50 ns;
        
        ASSERT FALSE
            REPORT "simulación terminada"
        SEVERITY FAILURE;
    
    end process;
end Behavioral;
