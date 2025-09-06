-- Takes two inputs and output common logic operators.
-- * inputs: 1 bit = a, b
-- * output: 1 bit = and, nand, or, nor, xor, nxor, not_a, not_b

library ieee;
use ieee.std_logic_1164.all;

-- Interface definition
entity logic_gates is
  port (
    -- inputs
    a, b : in std_logic;
    -- outputs
    o_and, o_nand, o_or, o_nor,
    o_xor, nxor, o_not_a, o_not_b : out std_logic
  );
end entity;

-- Behavior definition
architecture behavior of logic_gates is
begin
    o_and <= a and b;
    o_nand <= a nand b;
    o_or <= a or b;
    o_nor <= a nor b;
    o_xor <= a xor b;
    nxor <= a xnor b;
    o_not_a <= not a;
    o_not_b <= not b;
end architecture;
