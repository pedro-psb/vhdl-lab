-- Takes two inputs and output common logic operators.
-- For fpga: DE10 MAX-lite
-- * inputs: 1 bit = a, b
-- * output: 1 bit = and, nand, or, nor, xor, nxor, not_a, not_b

library ieee;
use ieee.std_logic_1164.all;

-- Interface definition
entity logic_gates is
  port (
    -- inputs
    sw : in std_logic_vector(9 downto 0);
    -- outputs
    ledr : out std_logic_vector(9 downto 0)
  );
end entity;

-- Behavior definition
architecture behavior of logic_gates is
begin
  ledr(0) <= sw(0) and sw(1);
  ledr(1) <= sw(0) nand sw(1);
  ledr(2) <= sw(0) or sw(1);
  ledr(3) <= sw(0) nor sw(1);
  ledr(4) <= sw(0) xor sw(1);
  ledr(5) <= sw(0) xnor sw(1);
  ledr(6) <= not sw(0);
  ledr(7) <= not sw(1);
  -- make remaining leds off
  ledr(8) <= '0';
  ledr(9) <= '0';
end architecture;
