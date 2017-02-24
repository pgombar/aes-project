----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_Multiply_X_GF_2
-- Module Name:    AES_Multiply_X_GF_2
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs Multiplication by X in GF(2)
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

entity aes_multiply_x_gf_2 is
    Port(
        a : in STD_LOGIC_VECTOR(7 downto 0);
        o : out STD_LOGIC_VECTOR(7 downto 0)
    );
end aes_multiply_x_gf_2;

architecture behavioral of aes_multiply_x_gf_2 is

begin

o <= a(6)  & a(5)  & a(4)  & (a(7) xor a(3))   & (a(7) xor a(2))   & a(1)  & (a(7) xor a(0))   & a(7);

end behavioral;