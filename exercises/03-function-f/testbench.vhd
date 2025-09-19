-- Funcao booleana F
library ieee;
use ieee.std_logic_1164.all;

entity tb_fn_f is
end entity;


architecture sim of tb_fn_f
is
  signal a,b,c,d,o : std_logic;
  signal pack : std_logic_vector(3 downto 0);
begin
  uut : entity work.fn_f(selecionada) port map(
    a => a, b => b, c => c, d => d, o => o
  );
  a <= pack(0);
  b <= pack(1);
  c <= pack(2);
  d <= pack(3);
  process
  begin
    pack <= "0000"; wait for 10 ns;
    pack <= "0001"; wait for 10 ns;
    pack <= "0010"; wait for 10 ns;
    pack <= "0011"; wait for 10 ns;
    pack <= "0100"; wait for 10 ns;
    pack <= "0101"; wait for 10 ns;
    pack <= "0110"; wait for 10 ns;
    pack <= "0111"; wait for 10 ns;
    pack <= "1000"; wait for 10 ns;
    pack <= "1001"; wait for 10 ns;
    pack <= "1010"; wait for 10 ns;
    pack <= "1011"; wait for 10 ns;
    pack <= "1100"; wait for 10 ns;
    pack <= "1101"; wait for 10 ns;
    pack <= "1110"; wait for 10 ns;
    pack <= "1111"; wait for 10 ns;
    wait;
  end process;
end architecture;
