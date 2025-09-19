library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- disponibiliza to_unsigned

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
    -- to_unsigned(<int positivo>, <num de bits>)
    -- E.g:
    -- >>> to_unsigned(3, 2) -> 11
    -- >>> to_unsigned(3, 3) -> 011
    -- >>> to_unsigned(3, 4) -> 0011
    for i in 0 to 15 loop
      pack <= std_logic_vector(to_unsigned(i, 4));
      wait for 10 ns;
    end loop;
    wait;
  end process;
end architecture;
