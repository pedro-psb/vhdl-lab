library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- disponibiliza to_unsigned

entity tb_dec3x8 is
end entity;


architecture sim of tb_dec3x8 
is
  signal input :  std_logic_vector(2 downto 0) := "000";
  signal output : std_logic_vector(7 downto 0) := "00000000";
begin
  uut : entity work.dec3x8(behavior_formula) port map(
    input => input, output => output
  );
  process
  begin
    for i in 0 to 7 loop
      input <= std_logic_vector(to_unsigned(i, 3));
      wait for 10 ns;
    end loop;
    wait;
  end process;
end architecture;
