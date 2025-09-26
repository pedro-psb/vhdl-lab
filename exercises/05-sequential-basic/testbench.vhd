library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- disponibiliza to_unsigned

entity tb_dff is
end entity;


architecture sim of tb_dff 
is
  -- clock helpers
  constant PERIOD : time := 10 ns;
  signal CLK_ENABLE : std_logic := '1';
  -- I/O
  signal d, s, clk :  std_logic := '0';
  signal q :  std_logic := '0';
begin
  uut : entity work.dff(s_active_low_sync) port map(
    d => d,
    s => s,
    clk => clk,
    q => q
  );
  -- setup clock
  clk <= CLK_ENABLE and not clk after PERIOD/2;
  process
  begin
    -- Test all possible combinations of d and s
    for i in 0 to 7 loop
      d <= std_logic(to_unsigned(i, 3)(0));  -- LSB
      s <= std_logic(to_unsigned(i, 3)(2));  -- MSB
      wait for PERIOD;
    end loop;

    -- Repeat the cycle one more time to verify behavior
    -- for i in 0 to 3 loop
    --   d <= std_logic(to_unsigned(i, 2)(0));
    --   s <= std_logic(to_unsigned(i, 2)(1));
    --   wait for PERIOD;
    -- end loop;

    CLK_ENABLE <= '0';
    wait;
  end process;
end architecture;
