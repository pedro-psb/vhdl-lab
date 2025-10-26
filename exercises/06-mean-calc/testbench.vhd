library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- disponibiliza to_unsigned

entity tb_mean is
end entity;


architecture sim of tb_mean
is
  -- helpers
  constant PERIOD : time := 10 ns;
  constant CYCLES : integer := 15;
  constant W: integer := 8;
  -- I/O
  signal clk : std_logic;
  signal reset : std_logic := '1';
  signal input : std_logic_vector(W - 1 downto 0);
  signal output : std_logic_vector(W - 1 downto 0);

begin
  uut : entity work.mean_4_clocks
  generic map( W => W )
  port map(
    clk => clk,
    reset => reset,
    input => input,
    output => output
  );

  -- processo do clock
  clk_process: process
  begin
    for i in 0 to CYCLES loop
      clk <= '0';
      wait for PERIOD / 2;
      clk <= '1';
      wait for PERIOD / 2;
    end loop;
    wait;
  end process;

  -- processo de estimulos
  test_process: process
  begin
    reset <= '0';
    input <= std_logic_vector(to_unsigned(0, W));
    wait for PERIOD / 4;

    input <= std_logic_vector(to_unsigned(4, W));
    wait for PERIOD * 4;

    input <= std_logic_vector(to_unsigned(8, W));
    wait for PERIOD;

    input <= std_logic_vector(to_unsigned(12, W));
    wait for PERIOD;

    input <= std_logic_vector(to_unsigned(16, W));
    wait for PERIOD;

    input <= std_logic_vector(to_unsigned(2 ** W - 1, W));
    wait for PERIOD * 4;

    wait;
  end process;
end architecture;
