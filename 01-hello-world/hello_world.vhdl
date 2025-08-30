-- Hello world program

use std.textio.all;

entity hello_world is
end entity;

architecture behavior of hello_world is
begin
  process
    variable l : line;
  begin
    write (l, String'("Hello world!"));
    writeline (output,l);
    wait;
  end process;
end architecture;
