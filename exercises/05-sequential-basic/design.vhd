-- D Flip-flop
--
-- arquiteturas:
--   * behavior_if
--   * behavior_case

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- INTERFACE:
-- input:  3x 1 bit
-- output: 1x 8 bit
entity dff is
  port(
    d, s, clk  : in std_logic := '0';
    q : out std_logic := '0'
  );
end entity;


-- Flip-Flop with sync active-low set input.
architecture s_active_low_sync of dff is
begin
  process(clk) is
  begin
    if (rising_edge(clk)) then
      if (s = '0') then q <= '1'; else q <= d; end if;
    end if;
  end process;
end architecture;


-- Flip-Flop with async active-low set input.
architecture s_active_low_async of dff is
begin
  process(clk, s) is
  begin
    if (s = '0') then
      q <= '1';
    elsif (rising_edge(clk)) then
      q <= d;
    end if;
  end process;
end architecture;
