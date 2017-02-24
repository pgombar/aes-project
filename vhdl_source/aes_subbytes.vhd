----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_SubBytes
-- Module Name:    AES_SubBytes
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs the AES SubBytes operation.
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

entity aes_subbytes is
    Port(
        a : in STD_LOGIC_VECTOR(127 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_subbytes;

architecture behavioral of aes_subbytes is

component aes_sbox
    Port (
        a : in STD_LOGIC_VECTOR(7 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

begin

sbox0 : aes_sbox
    Port Map(
        a => a(7 downto 0),
        enc_dec => enc_dec,
        o => o(7 downto 0)
    );
    
sbox1 : aes_sbox
    Port Map(
        a => a(15 downto 8),
        enc_dec => enc_dec,
        o => o(15 downto 8)
    );
    
sbox2 : aes_sbox
    Port Map(
        a => a(23 downto 16),
        enc_dec => enc_dec,
        o => o(23 downto 16)
    );

sbox3 : aes_sbox
    Port Map(
        a => a(31 downto 24),
        enc_dec => enc_dec,
        o => o(31 downto 24)
    );

sbox4 : aes_sbox
    Port Map(
        a => a(39 downto 32),
        enc_dec => enc_dec,
        o => o(39 downto 32)
    );

sbox5 : aes_sbox
    Port Map(
        a => a(47 downto 40),
        enc_dec => enc_dec,
        o => o(47 downto 40)
    );

sbox6 : aes_sbox
    Port Map(
        a => a(55 downto 48),
        enc_dec => enc_dec,
        o => o(55 downto 48)
    );

sbox7 : aes_sbox
    Port Map(
        a => a(63 downto 56),
        enc_dec => enc_dec,
        o => o(63 downto 56)
    );

sbox8 : aes_sbox
    Port Map(
        a => a(71 downto 64),
        enc_dec => enc_dec,
        o => o(71 downto 64)
    );

sbox9 : aes_sbox
    Port Map(
        a => a(79 downto 72),
        enc_dec => enc_dec,
        o => o(79 downto 72)
    );

sbox10 : aes_sbox
    Port Map(
        a => a(87 downto 80),
        enc_dec => enc_dec,
        o => o(87 downto 80)
    );

sbox11 : aes_sbox
    Port Map(
        a => a(95 downto 88),
        enc_dec => enc_dec,
        o => o(95 downto 88)
    );

sbox12 : aes_sbox
    Port Map(
        a => a(103 downto 96),
        enc_dec => enc_dec,
        o => o(103 downto 96)
    );

sbox13 : aes_sbox
    Port Map(
        a => a(111 downto 104),
        enc_dec => enc_dec,
        o => o(111 downto 104)
    );

sbox14 : aes_sbox
    Port Map(
        a => a(119 downto 112),
        enc_dec => enc_dec,
        o => o(119 downto 112)
    );

sbox15 : aes_sbox
    Port Map(
        a => a(127 downto 120),
        enc_dec => enc_dec,
        o => o(127 downto 120)
    );    

end behavioral;