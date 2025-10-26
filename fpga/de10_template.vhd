-- ==============================================================================
-- DE10-Lite FPGA Board Template
-- ==============================================================================
-- This template provides a top-level entity for the DE10-Lite board with
-- some available I/O pins mapped according to the pin assignment file.
--
-- Features:
--   - 50 MHz clock
--   - 2 push buttons (KEY)
--   - 10 slide switches (SW)
--   - 10 red LEDs (LEDR)
--   - 6 seven-segment displays (HEX0-HEX5)
--
-- Usage:
--   1. Instantiate your components within the architecture
--   2. Connect signals as needed
--   3. Assign pin locations using the provided CSV file or constraints
-- ==============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity de10_template is port (
    CLOCK_50 : in  std_logic;  -- Clock 50MHz
    KEY : in std_logic_vector(1 downto 0);  -- Push buttons (active low)
    SW : in std_logic_vector(9 downto 0);  -- Slide switches
    LEDR : out std_logic_vector(9 downto 0)  -- Red LEDs
); end entity;


architecture structural of de10_template is
    -- Internal signals
    signal clk, reset_n : std_logic;

    -- Components
    component sample is port (
        clk   : in  std_logic;
        reset : out std_logic
    ); end component;
begin
    -- General assigments
    clk <= CLOCK_50;
    reset_n <= KEY(0);

    -- Main components
    main: sample port map (
        clk => clk,
        reset => reset_n
    );
end architecture;

