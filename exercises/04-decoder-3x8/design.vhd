-- Decoder 3x8
-- 
-- arquiteturas:
--   * behavior_if
--   * behavior_case

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- INTERFACE:
-- input:  1 de 3 bit
-- output: 1 de 8 bit
entity dec3x8 is
  port(
    input  : in std_logic_vector(2 downto 0) := "000";
    output : out std_logic_vector(7 downto 0) := "00000000"
  );
end entity;


-- process com if
architecture behavior_if of dec3x8 is
begin
  process(all) is
  begin
    if    (input="000") then output <= "00000001";
    elsif (input="001") then output <= "00000010";
    elsif (input="010") then output <= "00000100";
    elsif (input="011") then output <= "00001000";
    elsif (input="100") then output <= "00010000";
    elsif (input="101") then output <= "00100000";
    elsif (input="110") then output <= "01000000";
    elsif (input="111") then output <= "10000000";
    else output <= "00000000";
    end if;
  end process;
end architecture;


-- process com case
architecture behavior_case of dec3x8 is
begin
  process(all) is
  begin
    case input is
    when "000" => output <= "00000001";
    when "001" => output <= "00000010";
    when "010" => output <= "00000100";
    when "011" => output <= "00001000";
    when "100" => output <= "00010000";
    when "101" => output <= "00100000";
    when "110" => output <= "01000000";
    when "111" => output <= "10000000";
    when others =>
      output <= "00000000";
    end case;
  end process;
end architecture;


-- usando formula
architecture behavior_formula of dec3x8 is
begin
  process(all)
  is
    variable output_unsigned : UNSIGNED(7 downto 0);
    variable input_unsigned : unsigned(2 downto 0);
    variable input_int : integer;
  begin
    input_unsigned := unsigned(input);  -- converte tipo: std_logic_vector -> unsigned
    input_int := to_integer(input_unsigned);  -- converte tipo: unsigned -> int
    output_unsigned := to_unsigned(2**input_int, 8);  -- operador ** necessita de int!
    output <= std_logic_vector(output_unsigned);
  end process;
end architecture;

