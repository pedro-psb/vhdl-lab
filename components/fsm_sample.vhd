-- FSM Sample - Sample de FSM (maquina de Mealy)
--
-- input:
--   x1, x2: 1 bit - Entradas da fms
--   clk: 1 bit - Entrada do clock
-- output:
--   z: N bit - Saida assincrona
--   ss: 1 bit - Saida do estado interno

library IEEE;
use IEEE.std_logic_1164.all;


entity fsm is port (
    X1, X2 ,CLK : in std_logic;
    Z : out std_logic;
    SS : out std_logic_vector(1 downto 0)
); end entity;


architecture fsm of fsm is
    signal PS, NS : std_logic_vector(1 downto 0);
begin
    -- Processo sequencial
    sync_proc: process(CLK)
    begin
        if (rising_edge(CLK)) then PS <= NS;
        end if;
    end process sync_proc;

    -- Externalizar estados
    SS <= PS;

    -- Processo combinacional
    comb_proc: process(PS, X1, X2) begin
      case PS is
          when "10" =>
              if (X1='0') then Z<='0'; NS <= PS;
              else Z<='0'; NS <= "01";
              end if;
          when "11" =>
              if (X2='1') then Z <= '0'; NS <= PS;
              else Z<='1'; NS <= "10";
              end if;
          when "01" =>
              if (X2='0') then Z <= '1'; NS <= "10";
              else Z<='0'; NS <= "11";
              end if;
          when others =>
          	Z <='0'; NS <= "10";
      end case;
    end process comb_proc;
end fsm;
