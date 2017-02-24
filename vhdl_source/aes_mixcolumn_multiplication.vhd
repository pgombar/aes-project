----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_MixCollumnMultiplication
-- Module Name:    AES_MixCollumnMultiplication
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs AES MixColumns to one columns.
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

entity aes_mixcolumn_multiplication is
    Port(
        a : in STD_LOGIC_VECTOR(31 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(31 downto 0)
    );
end aes_mixcolumn_multiplication;

architecture behavioral of aes_mixcolumn_multiplication is

component aes_multiply_x_gf_2
    Port(
        a : in STD_LOGIC_VECTOR(7 downto 0);
        o : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

signal a_times_2 : STD_LOGIC_VECTOR(31 downto 0);
signal a_times_3 : STD_LOGIC_VECTOR(31 downto 0);
signal a_times_4 : STD_LOGIC_VECTOR(31 downto 0);
signal a_times_8 : STD_LOGIC_VECTOR(31 downto 0);
signal a_times_9 : STD_LOGIC_VECTOR(31 downto 0);
signal a_times_11 : STD_LOGIC_VECTOR(31 downto 0);
signal a_times_13 : STD_LOGIC_VECTOR(31 downto 0);
signal a_times_14 : STD_LOGIC_VECTOR(31 downto 0);

signal o_enc : STD_LOGIC_VECTOR(31 downto 0);
signal o_dec : STD_LOGIC_VECTOR(31 downto 0);

begin

a_times_2_0 : aes_multiply_x_gf_2
    Port Map(
        a => a(7 downto 0),
        o => a_times_2(7 downto 0)
    );

a_times_2_1 : aes_multiply_x_gf_2
    Port Map(
        a => a(15 downto 8),
        o => a_times_2(15 downto 8)
    );

a_times_2_2 : aes_multiply_x_gf_2
    Port Map(
        a => a(23 downto 16),
        o => a_times_2(23 downto 16)
    );

a_times_2_3 : aes_multiply_x_gf_2
    Port Map(
        a => a(31 downto 24),
        o => a_times_2(31 downto 24)
    );
        
a_times_4_0 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_2(7 downto 0),
        o => a_times_4(7 downto 0)
    );

a_times_4_1 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_2(15 downto 8),
        o => a_times_4(15 downto 8)
    );

a_times_4_2 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_2(23 downto 16),
        o => a_times_4(23 downto 16)
    );
    
a_times_4_3 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_2(31 downto 24),
        o => a_times_4(31 downto 24)
    );    
    
a_times_8_0 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_4(7 downto 0),
        o => a_times_8(7 downto 0)
    );

a_times_8_1 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_4(15 downto 8),
        o => a_times_8(15 downto 8)
    );

a_times_8_2 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_4(23 downto 16),
        o => a_times_8(23 downto 16)
    );

a_times_8_3 : aes_multiply_x_gf_2
    Port Map(
        a => a_times_4(31 downto 24),
        o => a_times_8(31 downto 24)
    );
    
a_times_3 <= a xor a_times_2;

a_times_9 <= a_times_8 xor a;
a_times_11 <= a_times_8 xor a_times_3;
a_times_13 <= a_times_8 xor a_times_4 xor a;
a_times_14 <=a_times_8 xor a_times_4 xor a_times_2;

o_enc(7 downto 0)   <= a_times_2(7 downto 0) xor a_times_3(15 downto 8) xor a(23 downto 16)         xor a(31 downto 24);
o_enc(15 downto 8)  <= a(7 downto 0)         xor a_times_2(15 downto 8) xor a_times_3(23 downto 16) xor a(31 downto 24);
o_enc(23 downto 16) <= a(7 downto 0)         xor a(15 downto 8)         xor a_times_2(23 downto 16) xor a_times_3(31 downto 24);
o_enc(31 downto 24) <= a_times_3(7 downto 0) xor a(15 downto 8)         xor a(23 downto 16)         xor a_times_2(31 downto 24);

o_dec(7 downto 0)   <= a_times_14(7 downto 0) xor a_times_11(15 downto 8) xor a_times_13(23 downto 16) xor a_times_9(31 downto 24);
o_dec(15 downto 8)  <= a_times_9(7 downto 0)  xor a_times_14(15 downto 8) xor a_times_11(23 downto 16) xor a_times_13(31 downto 24);
o_dec(23 downto 16) <= a_times_13(7 downto 0) xor a_times_9(15 downto 8)  xor a_times_14(23 downto 16) xor a_times_11(31 downto 24);
o_dec(31 downto 24) <= a_times_11(7 downto 0) xor a_times_13(15 downto 8) xor a_times_9(23 downto 16)  xor a_times_14(31 downto 24);

o <= o_enc when enc_dec = '1' else
     o_dec;

end behavioral;