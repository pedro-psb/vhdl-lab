-- Funcao booleana F

library ieee;
use ieee.std_logic_1164.all;


entity fn_f is
  port(
    a,b,c,d : in std_logic;
    o : out std_logic
  );
end entity;


-- atribuicao simultanea
architecture simultanea of fn_f is
begin
  o <= (
    ((not a) and c and (not d))
    or ((not b) and c)
    or (b and c and (not d))
  );
end architecture;


-- atribuicao conditional
architecture condicional of fn_f is
begin
  o <=
    '1' when (a='0' and c='1' and d='0') else
    '1' when (b='0' and c='1') else
    '1' when (b='1' and c='1' and d='0') else
    '0';
end architecture;


-- atribuicao selecionada
architecture selecionada of fn_f
is
	signal pack : std_logic_vector(3 downto 0);
begin
	pack <= a & b & c & d;
  with pack select
      o <=
        -- '1' when "0-10",
        '1' when "0010",
        '1' when "0110",
        -- '1' when "-01-",
        '1' when "0011",
        '1' when "1010",
        '1' when "1011",
        -- '1' when "-110",
        '1' when "1110",
        '0' when others;
end architecture;

