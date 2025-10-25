-- Testbench para XOR de multiplas entradas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- disponibiliza to_unsigned
use std.textio.all; -- inclui manipulacao de arquivos

entity tb_xor is
end entity;


architecture sim of tb_xor
is
    constant N : integer := 8;
    signal data_in :  std_logic_vector(N-1 downto 0);
    signal data_out : std_logic;
begin
    uut : entity work.xor_n
    generic map(N => N)
    port map(
      data_in => data_in,
      data_out => data_out
    );

    estimulos : process
    is
        file text_file : text open read_mode is "input.txt";
        file test_output : text open write_mode is "output.txt";
        variable text_line, output_line : line;
        variable ok : boolean;
        variable input_txt : data_in'subtype; -- onde valor to arquivo sera carregado
    begin
        -- caminha por cada linha do arquivo
        while not endfile(text_file) loop
            -- le linha e carrega valor na variavel
            readline(text_file, text_line);
            read(text_line, input_txt, ok);
            assert ok report "Read 'wait_time' failed for line: " & text_line.all severity failure;

            -- estimulo
            data_in <= input_txt;
            wait for 10 ns;

            -- grava saida
            write(output_line, data_out, right, 1);
            writeline(test_output, output_line);
        end loop;

        file_close(text_file);
        file_close(test_output);
        wait;
    end process;
end architecture;
