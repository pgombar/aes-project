----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    AES_AddRoundKeys
-- Module Name:    AES_AddRoundKeys
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- Performs the AES AddRoundKeys operation.
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

entity aes_addroundkeys is
    Port(
        a : in STD_LOGIC_VECTOR(127 downto 0);
        key : in STD_LOGIC_VECTOR(127 downto 0);
        o : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_addroundkeys;

architecture behavioral of aes_addroundkeys is

begin

o <= a xor key;

end behavioral;