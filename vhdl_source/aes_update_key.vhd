----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_KeyUpdate
-- Module Name:    AES_KeyUpdate
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs the AES Key update from previous key. 
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

entity aes_update_key is
    Port(
        enc_dec : in STD_LOGIC;
        key : in STD_LOGIC_VECTOR(127 downto 0);
        round_constant : in STD_LOGIC_VECTOR(7 downto 0);
        new_key : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_update_key;
 
architecture behavioral of aes_update_key is

component aes_sbox is
    Port (
        a : in STD_LOGIC_VECTOR(7 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;
 
signal key0 : STD_LOGIC_VECTOR(31 downto 0);
signal key1 : STD_LOGIC_VECTOR(31 downto 0);
signal key2 : STD_LOGIC_VECTOR(31 downto 0);
signal key3 : STD_LOGIC_VECTOR(31 downto 0);
signal tmp_key3 : STD_LOGIC_VECTOR(31 downto 0);

signal subword_key3 : STD_LOGIC_VECTOR(31 downto 0);
signal rcon_key3 : STD_LOGIC_VECTOR(31 downto 0);

signal subword_sbox_enc_dec : STD_LOGIC;

signal enc0 : STD_LOGIC_VECTOR(31 downto 0);
signal enc1 : STD_LOGIC_VECTOR(31 downto 0);
signal enc2 : STD_LOGIC_VECTOR(31 downto 0);
signal enc3 : STD_LOGIC_VECTOR(31 downto 0);


signal dec0 : STD_LOGIC_VECTOR(31 downto 0);
signal dec1 : STD_LOGIC_VECTOR(31 downto 0);
signal dec2 : STD_LOGIC_VECTOR(31 downto 0);
signal dec3 : STD_LOGIC_VECTOR(31 downto 0);

signal new_key_enc : STD_LOGIC_VECTOR(127 downto 0);
signal new_key_dec : STD_LOGIC_VECTOR(127 downto 0);

begin

key0 <= key(31 downto 0);
key1 <= key(63 downto 32); 
key2 <= key(95 downto 64);
key3 <= key(127 downto 96);

tmp_key3 <= dec3 when enc_dec = '0' else key3;

-- SubWord operation
aes_sbox0 : aes_sbox
    Port Map(
        a => tmp_key3(15 downto 8),
        enc_dec => subword_sbox_enc_dec,
        o => subword_key3(7 downto 0)
    );

aes_sbox1 : aes_sbox
    Port Map(
        a => tmp_key3(23 downto 16),
        enc_dec => subword_sbox_enc_dec,
        o => subword_key3(15 downto 8)
    );

aes_sbox2 : aes_sbox
    Port Map(
        a => tmp_key3(31 downto 24),
        enc_dec => subword_sbox_enc_dec,
        o => subword_key3(23 downto 16)
    );

aes_sbox3 : aes_sbox
    Port Map(
        a => tmp_key3(7 downto 0),
        enc_dec => subword_sbox_enc_dec,
        o => subword_key3(31 downto 24)
    );

subword_sbox_enc_dec <= '1';

-- Rcon operation
    
rcon_key3(31 downto 8) <= subword_key3(31 downto 8);
rcon_key3(7 downto 0) <= subword_key3(7 downto 0) xor round_constant;

-- Key update

enc0 <= rcon_key3 xor key0;
enc1 <= enc0 xor key1;
enc2 <= enc1 xor key2;
enc3 <= enc2 xor key3;

dec0 <= rcon_key3 xor key0;
dec1 <= key0 xor key1;
dec2 <= key1 xor key2;
dec3 <= key3 xor key2;

new_key_enc <= enc3 & enc2 & enc1 & enc0;
new_key_dec <= dec3 & dec2 & dec1 & dec0;

new_key <= new_key_enc when enc_dec = '1' else new_key_dec;

end behavioral;