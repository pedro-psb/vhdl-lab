-- Half Adder
--
-- input:
--   a, b:  1 bits
-- output:
--   output: 1 bit
--   cout: 1 bit

library ieee;
use ieee.std_logic_1164.all;


entity half_adder is
    port (
        a    : in  std_logic;
        b    : in  std_logic;
        sum  : out std_logic;
        cout : out std_logic
    );
end entity half_adder;


architecture behavioral of half_adder is
begin
    -- processo combinacional
    process(a, b)
    begin
        sum <= a xor b;
        cout <= a and b;
    end process;
end architecture behavioral;
