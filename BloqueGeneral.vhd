library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BloqGeneral is
     Port (
        boton: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sensor: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        piso_sig_1, piso_sig_2: OUT NATURAL RANGE 0 TO 3;
        reset: IN STD_LOGIC;
        clk: IN STD_LOGIC
      );
end BloqGeneral;

architecture Structural of BloqGeneral is
    
    COMPONENT deboun
        PORT (
                    clk: IN STD_LOGIC;
                    rst: IN STD_LOGIC;
                    btn_in: IN STD_LOGIC;
                    btn_out: OUT STD_LOGIC
                );
    END COMPONENT;
    
    COMPONENT sincro
        PORT (
                    sync_in: in STD_LOGIC;
                    clk: IN STD_LOGIC;
                    sync_out : OUT STD_LOGIC
                );
    END COMPONENT;
    
    COMPONENT b_decoder
        PORT (
                    piso0,piso1,piso2,piso3 : in STD_LOGIC;
                    p_sig: OUT NATURAL RANGE 0 TO 3
                );
    END COMPONENT;


    SIGNAL boton_sinc_1: std_logic_vector(3 DOWNTO 0);
    SIGNAL boton_sinc_2: std_logic_vector(3 DOWNTO 0);
    SIGNAL piso_bot: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL piso_sen: STD_LOGIC_VECTOR(3 DOWNTO 0);

    
begin

     vector1: FOR i IN 0 TO 3 GENERATE
       Inst_sincronizador_1: sincro port map( 
        sync_in=>boton(i), 
        clk=>clk,
        sync_out=>boton_sinc_1(i)
    );
     END GENERATE;    
   
    intermedio_1: FOR i IN 0 TO 3 GENERATE
       Inst_debouncer_1: deboun port map(
        clk=> clk,
        rst=> reset,
        btn_in => boton_sinc_1(i),
        btn_out=> piso_bot(i)
        );
    END GENERATE;
    
    Inst_boton_decoder_1: b_decoder port map( 
        piso0=>piso_bot(0),
        piso1=>piso_bot(1),
        piso2=>piso_bot(2),
        piso3=>piso_bot(3),
        p_sig=>piso_sig_1
    );  


     vector2: FOR i IN 0 TO 3 GENERATE
       Inst_sincronizador_2: sincro port map( 
        sync_in=>sensor(i), 
        clk=>clk,
        sync_out=>boton_sinc_2(i)
    );
     END GENERATE;    
   
    intermedio_2: FOR i IN 0 TO 3 GENERATE
       Inst_debouncer_2: deboun port map(
        clk=> clk,
        rst=> reset,
        btn_in => boton_sinc_2(i),
        btn_out=> piso_sen(i)
        );
    END GENERATE;

    Inst_boton_decoder_2: b_decoder port map( 
        piso0=>piso_sen(0),
        piso1=>piso_sen(1),
        piso2=>piso_sen(2),
        piso3=>piso_sen(3),
        p_sig=>piso_sig_2
    );


end Structural;
