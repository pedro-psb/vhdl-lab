library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- disponibiliza to_unsigned

entity tb_xor is
end entity;


architecture sim of tb_xor 
is
  constant N : integer := 8;
  signal data_in :  std_logic_vector(N-1 downto 0);
  signal data_out : std_logic;
begin
  uut : entity work.xor_n
  generic map(N => N)
  port map(
    data_in => data_in,
    data_out => data_out
  );

  estimulos : process
  begin
    data_in <= "00000000";
    wait for 10 ns;

    data_in <= "00000001";
    wait for 10 ns;

    data_in <= "00000011";
    wait for 10 ns;

    data_in <= "00000111";
    wait for 10 ns;
    wait;
  end process;
end architecture;
