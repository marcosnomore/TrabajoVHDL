library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity b_decoder is
    Port(
        piso0, piso1, piso2, piso3: IN STD_LOGIC;
        p_sig: OUT NATURAL RANGE 0 TO 3
    );
end b_decoder;

architecture Dataflow of b_decoder is
    SIGNAL p_sig_aux: NATURAL RANGE 0 TO 3;

begin
         p_sig_aux<=3 WHEN (piso0='0' AND piso1='0' AND piso2='0' AND piso3='1') ELSE
                    2 WHEN (piso0='0' AND piso1='0' AND piso2='1' AND piso3='0') ELSE
                    1 WHEN (piso0='0' AND piso1='1' AND piso2='0' AND piso3='0') ELSE 
                    0 WHEN (piso0='1' AND piso1='0' AND piso2='0' AND piso3='0') ELSE
                    p_sig_aux;
                    
     p_sig<=p_sig_aux;
end Dataflow;
