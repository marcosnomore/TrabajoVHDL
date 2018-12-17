library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity siguiente_estado is
    PORT(
        clk,reset: IN STD_LOGIC;
        piso_deseado, piso_actual: IN NATURAL RANGE 0 TO 3;
        puerta: OUT STD_LOGIC;
        motor: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
end siguiente_estado;


architecture Behavioral of siguiente_estado is
TYPE state_type IS (S0, S1, S2);
SIGNAL estado: state_type;
SIGNAL siguiente_estado: state_type:=S0;
SIGNAL memoria_boton: NATURAL RANGE 0 TO 3;

begin
REGISTRO_ESTADO_ACTUAL_y_MEMORIA_BOTON: PROCESS (clk)
    BEGIN
        IF (clk'event AND clk='1') THEN
            IF (reset = '1') THEN
                estado <= S0;
            ELSE
                estado <= siguiente_estado;
                IF(estado=S0) THEN
                    memoria_boton<=piso_deseado;
                END IF;
            END IF;
        END IF;
    END PROCESS;

LOGICA_SALIDAS: PROCESS(estado)
    BEGIN
        CASE(estado) IS
            WHEN S0=> motor<="11"; puerta<='1';
            WHEN S1=> motor<="01"; puerta<='0';
            WHEN S2=> motor<="10"; puerta<='0';
        END CASE;
    END PROCESS;

LOGICA_ESTADO_SIGUIENTE: PROCESS(clk)
    BEGIN
        siguiente_estado<=S0;
    CASE(estado) IS
            WHEN S0=>
                IF(memoria_boton=piso_actual) THEN 
                    siguiente_estado<=S0;
                ELSIF (memoria_boton<piso_actual) THEN
                    siguiente_estado<=S2;
                ELSIF (memoria_boton>piso_actual) THEN
                    siguiente_estado<=S1;
                END IF;
                
            WHEN S1=>
                IF(memoria_boton=piso_actual) THEN 
                     siguiente_estado<=S0;
                ELSE --(memoria_boton>piso_actual) THEN
                     siguiente_estado<=S1;
                END IF;
                 
             WHEN S2=>
                IF(memoria_boton=piso_actual) THEN 
                     siguiente_estado<=S0;
                ELSE --(memoria_boton<piso_actual) THEN
                     siguiente_estado<=S2;
                END IF;           
     END CASE;
  END PROCESS;       

end Behavioral;
