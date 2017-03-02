----------------------------------------------------------------------------------

--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity aes_store_key is
    Port(
        input_key : in STD_LOGIC_VECTOR(127 downto 0);
        clk : in STD_LOGIC;
        write_key_enable : in STD_LOGIC;
        output_key : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_store_key;

architecture behavioral of aes_store_key is

signal memory_key : STD_LOGIC_VECTOR(127 downto 0);

begin

generate_key : process(clk)
    begin
        if(rising_edge(clk)) then
            if(write_key_enable = '1') then
                memory_key <= input_key;
            end if;
            output_key <= memory_key;
        end if;
    end process;

end behavioral;