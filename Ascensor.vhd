library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Ascen is
     Port (
        botones: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sensores: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        clock,reset: IN STD_LOGIC;
        puerta: OUT STD_LOGIC;
        motor:OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
   );
    
end Ascen;

architecture Structural of Ascen is

    COMPONENT BloqGeneral
         Port (
            boton: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            sensor: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            piso_sig_1, piso_sig_2:OUT NATURAL RANGE 0 TO 3;
            reset: IN STD_LOGIC;
            clk: IN STD_LOGIC
        );
     END COMPONENT;
     
     COMPONENT siguiente_estado
         PORT(
         clk,reset: IN STD_LOGIC;
         piso_deseado, piso_actual: IN NATURAL RANGE 0 TO 3;
         puerta: OUT STD_LOGIC;
         motor: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
     );
     END COMPONENT;
   
   
    SIGNAL piso_boton: NATURAL RANGE 0 TO 3;
    SIGNAL piso_sensor: NATURAL RANGE 0 TO 3;
  
begin
    
    Inst_Bloque_General: BloqGeneral port map( 
        boton=>botones,
        sensor=>sensores,
        piso_sig_1=>piso_boton,
        piso_sig_2=>piso_sensor,
        reset=>reset,
        clk=>clock
      );
      
      Inst_MaquinaEstados:siguiente_estado port map(
        clk=>clock,
        reset=>reset,
        piso_deseado=>piso_boton,
        piso_actual=> piso_sensor,
        puerta=>puerta,
        motor=>motor
      );

end Structural;
