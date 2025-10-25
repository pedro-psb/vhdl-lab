-- XOR simples

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- INTERFACE:
-- a, b:  1 bits
-- output: 1 bit
entity xor_simple is
  port(
    a,b  : in std_logic;
    output : out std_logic
  );
end entity;


architecture structural of xor_simple is
begin
  output <= a xor b;
end architecture;
