----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_Inverse_Multiply_X_GF_2
-- Module Name:    AES_Inverse_Multiply_X_GF_2
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs the inverse of multiply by X in GF(2)
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

entity aes_inverse_multiply_x_gf_2 is
    Port(
        a : in STD_LOGIC_VECTOR(7 downto 0);
        o : out STD_LOGIC_VECTOR(7 downto 0)
    );
end aes_inverse_multiply_x_gf_2;

architecture behavioral of aes_inverse_multiply_x_gf_2 is

begin

o <= a(0) & a(7)  & a(6) & a(5)  & (a(4) xor a(0)) & (a(3) xor a(0)) & a(2) & (a(1) xor a(0));

end behavioral;