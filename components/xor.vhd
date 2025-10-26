-- XOR simples
--
-- input:
--   a, b:  1 bits
-- output:
--   output: 1 bit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity xor_simple is
  port(
    a,b  : in std_logic;
    output : out std_logic
  );
end entity;


architecture dataflux of xor_simple is
begin
  output <= a xor b;
end architecture;
