----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_AllRoundsKeys
-- Module Name:    AES_AllRoundsKeys
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Storages all AES round keys.
--
--
-- Dependencies:
-- VHDL-93
--
--
-- Revision: 
-- Revision 1.0
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity aes_all_rounds_keys is
    Port(
        clk : in STD_LOGIC;
        input_key : in STD_LOGIC_VECTOR(127 downto 0);
        round_number : in STD_LOGIC_VECTOR(3 downto 0);
        write_key_enable : in STD_LOGIC;
        output_key : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_all_rounds_keys;

architecture behavioral of aes_all_rounds_keys is

type memory is array (0 to 15) of STD_LOGIC_VECTOR(127 downto 0);

signal all_rounds_keys : memory;

begin

mem_procedure : process(clk)
    begin
        if(rising_edge(clk)) then
            if(write_key_enable = '1') then
                all_rounds_keys(to_integer(unsigned(round_number))) <= input_key;
            end if;
            output_key <= all_rounds_keys(to_integer(unsigned(round_number)));
        end if;
    end process;

end behavioral;