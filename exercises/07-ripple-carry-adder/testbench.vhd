-- Teste do ripple carry adder
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  


entity tb_adder is
end entity;


architecture sim of tb_adder 
is
  constant N : integer := 4;
  signal a : std_logic_vector (N-1 downto 0);
  signal b : std_logic_vector (N-1 downto 0);
  signal cout : std_logic;
  signal sum : std_logic_vector (N-1 downto 0);
begin
	uut : entity work.ripple_carry_adder
    generic map( N => N )
    port map(
      a => a,
      b => b,
      cout => cout,
      sum => sum
  );

  -- processo
  process
  begin
  	for i in 0 to 2**N-1 loop 
      for j in 0 to 2**N-1 loop 
    		a <= std_logic_vector(to_unsigned(i, N));
        b <= std_logic_vector(to_unsigned(j, N));
        wait for 10 ns;
    	end loop;
    end loop;
    wait;
  end process;
end architecture;
