-- Funcao booleana F
library ieee;
use ieee.std_logic_1164.all;

entity tb_fn_f is
end entity;


architecture sim of tb_fn_f is
  signal a,b,c,d,o : std_logic;
begin
  uut : entity work.fn_f port map(
    a => a, b => b, c => c, d => d, o => o
  );
  process
  begin
      a <= '0'; b <= '0'; c <= '0'; d <= '0'; wait for 10 ns;
      a <= '0'; b <= '0'; c <= '0'; d <= '1'; wait for 10 ns;
      a <= '0'; b <= '0'; c <= '1'; d <= '0'; wait for 10 ns;
      a <= '0'; b <= '0'; c <= '1'; d <= '1'; wait for 10 ns;
      wait;
  end process;
end architecture;
