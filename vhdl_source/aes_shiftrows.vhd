----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_ShiftRows
-- Module Name:    AES_ShiftRows
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs the AES ShiftRows operation.
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

entity aes_shiftrows is
    Port(
        a : in STD_LOGIC_VECTOR(127 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_shiftrows;

architecture behavioral of aes_shiftrows is

begin

-- First Row                                  --
-- Does not shift                             --
o(7 downto 0)     <= a(7 downto 0);
o(39 downto 32)   <= a(39 downto 32);
o(71 downto 64)   <= a(71 downto 64);
o(103 downto 96)  <= a(103 downto 96);

-- Second Row                                 --
-- Shift one position to the left             --
o(15 downto 8)    <= a(47 downto 40) when enc_dec = '1' else
                     a(111 downto 104);
o(47 downto 40)   <= a(79 downto 72) when enc_dec = '1' else
                     a(15 downto 8);
o(79 downto 72)   <= a(111 downto 104) when enc_dec = '1' else
                     a(47 downto 40);
o(111 downto 104) <= a(15 downto 8) when enc_dec = '1' else
                     a(79 downto 72);

-- Third Row                                  --
-- Shift two positions to the left            --
-- Encryption and decryption are the same     --
o(23 downto 16)   <= a(87 downto 80) when enc_dec = '1' else
                     a(87 downto 80);
o(55 downto 48)   <= a(119 downto 112) when enc_dec = '1' else
                     a(119 downto 112);
o(87 downto 80)   <= a(23 downto 16) when enc_dec = '1' else
                     a(23 downto 16);
o(119 downto 112) <= a(55 downto 48) when enc_dec = '1' else
                     a(55 downto 48);
                    
-- Fourth Row                                 --
-- Shift three positions to the left          --            
o(31 downto 24)   <= a(127 downto 120) when enc_dec = '1' else
                     a(63 downto 56);                   
o(63 downto 56)   <= a(31 downto 24) when enc_dec = '1' else
                     a(95 downto 88);   
o(95 downto 88)   <= a(63 downto 56) when enc_dec = '1' else
                     a(127 downto 120);      
o(127 downto 120) <= a(95 downto 88) when enc_dec = '1' else
                     a(31 downto 24);                      

end behavioral;