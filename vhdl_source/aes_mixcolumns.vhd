----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_MixCollumns
-- Module Name:    AES_MixCollumns
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs the AES MixColumns operation.
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

entity aes_mixcolumns is
    Port(
        a : in STD_LOGIC_VECTOR(127 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_mixcolumns;

architecture behavioral of aes_mixcolumns is

component aes_mixcolumn_multiplication is
    Port(
        a : in STD_LOGIC_VECTOR(31 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

begin

aes_mixcolumn_multiplication0 : aes_mixcolumn_multiplication
    Port map(
        a => a(31 downto 0),
        enc_dec => enc_dec,
        o => o(31 downto 0)
    );
    
aes_mixcolumn_multiplication1 : aes_mixcolumn_multiplication
    Port map(
        a => a(63 downto 32),
        enc_dec => enc_dec,
        o => o(63 downto 32)
    );
    
aes_mixcolumn_multiplication2 : aes_mixcolumn_multiplication
    Port map(
        a => a(95 downto 64),
        enc_dec => enc_dec,
        o => o(95 downto 64)
    );
    
aes_mixcolumn_multiplication3 : aes_mixcolumn_multiplication
    Port map(
        a => a(127 downto 96),
        enc_dec => enc_dec,
        o => o(127 downto 96)
    );

end behavioral;
