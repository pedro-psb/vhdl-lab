-- Funcao booleana F
library ieee;
use ieee.std_logic_1164.all;


-- Attribuicao simultanea
entity fn_f is
  port(
    a,b,c,d : in std_logic;
    o : out std_logic
  );
end entity;


architecture behavior of fn_f is
begin
  o <= (
    ((not a) and (c) and (not d))
    or ((not b) and c)
    or (b and c and (not d))
  );
end architecture;

