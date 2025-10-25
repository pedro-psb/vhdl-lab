-- XOR com multiplas entradas e design estrutural

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- INTERFACE:
-- input:  N bits
-- output: 1 bit
entity xor_n is
  generic( N : integer := 4 );
  port(
      data_in  : in std_logic_vector(N-1 downto 0);
      data_out : out std_logic
  );
end entity;


architecture structural of xor_n is
    -- Declaracao dos sinais internos
    signal tmp: std_logic_vector(N-1 downto 0);

    -- Declaração dos componentes internos que serao utilizados
    component xor_simple is
        port (
              a, b : in std_logic;
              output : out std_logic
          );
    end component;
begin
    -- Inicializa link inicial
    tmp(0) <= data_in(0);

    -- Conecta link final com output
    data_out <= tmp(N-1);

    -- Instancia e encadeia N-1 xor simples com as entradas
    gen_fa : for i in 1 to N - 1 generate
          xs: xor_simple port map (
              a => tmp(i-1),
              b => data_in(i),
              output => tmp(i)
          );
    end generate;
end architecture;
