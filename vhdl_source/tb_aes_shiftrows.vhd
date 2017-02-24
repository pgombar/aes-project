----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    TestBench_AES_ShiftRows
-- Module Name:    TestBench_AES_ShiftRows
-- Project Name:   AES128_Demo
-- Target Devices: Any
--
-- Description: 
--
-- 
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

entity tb_aes_shiftrows is
    Generic(
        PERIOD : time := 100 ns;
        number_of_encryption_tests : integer := 10
    );
end tb_aes_shiftrows;

architecture behavioral of tb_aes_shiftrows is

component aes_shiftrows
    Port(
        a : in STD_LOGIC_VECTOR(127 downto 0);
        enc_dec : in STD_LOGIC;
        o : out STD_LOGIC_VECTOR(127 downto 0)
    );
end component;

signal test_a : STD_LOGIC_VECTOR(127 downto 0);
signal test_enc_dec : STD_LOGIC;
signal test_o : STD_LOGIC_VECTOR(127 downto 0);
signal true_o : STD_LOGIC_VECTOR(127 downto 0);

signal test_error : STD_LOGIC;

type test_array is array (integer range <>) of STD_LOGIC_VECTOR(127 downto 0);

constant test_input_enc : test_array(1 to number_of_encryption_tests) := (
X"3052411EE55DB4B8F198BFE0AE1127D4",
X"3B5302771A87397FF196DB4589D2DE49",
X"B85A2345B5D6B513DF11C1EF7BCF73AC",
X"946ACFF607C811E3D75EA485282F5052",
X"7CAE6C975396C835BAFBFBE89BD24FE1",
X"FE03D54C233DE810DF294F78FCA863A1",
X"3F3DB554D340439BFFA98327F031ABF7",
X"FEF264DA4DD4E10AC0863BD4C82C83BE",
X"A6E7909795464C4DD8C36EF28C4AEC87",
X"B52C2EAF947D323D5F0731CB728909E9");

constant test_output_enc : test_array(1 to number_of_encryption_tests) := (
X"E598271EF11141B8AE52B4E0305DBFD4",
X"1A96DE77F1D2027F895339453B87DB49",
X"B5117345DFCF23137B5AB5EFB8D6C1AC",
X"075E50F6D72FCFE3286A118594C8A452",
X"53FB4F97BAD26C359BAEC8E87C96FBE1",
X"2329634CDFA8D510FC03E878FE3D4FA1",
X"D3A9AB54FF31B59BF03D43273F4083F7",
X"4D8683DAC02C640AC8F2E1D4FED43BBE",
X"95C3EC97D84A904D8CE74CF2A6466E87",
X"940709AF5F892E3D722C32CBB57D31E9");

begin

test : aes_shiftrows
    Port Map(
        a => test_a,
        enc_dec => test_enc_dec,
        o => test_o
    );
    
    
process
    begin
        report "Start Shiftrows encryption test." severity note;
        test_enc_dec <= '1';
        test_error <= '0';
        wait for PERIOD;
        for I in 1 to number_of_encryption_tests loop
            test_error <= '0';
            test_a <= test_input_enc(I);
            true_o <= test_output_enc(I);
            wait for PERIOD;
            if (true_o = test_o) then
                test_error <= '0';
            else
                test_error <= '1';
                report "Computed values do not match expected ones" severity error;
            end if;
            wait for PERIOD;
            test_error <= '0';
            wait for PERIOD;
        end loop;
        report "Start Shiftrows decryption test." severity note;
        test_enc_dec <= '0';
        test_error <= '0';
        wait for PERIOD;
        for I in 1 to number_of_encryption_tests loop
            test_error <= '0';
            test_a <= test_output_enc(I);
            true_o <= test_input_enc(I);
            wait for PERIOD;
            if (true_o = test_o) then
                test_error <= '0';
            else
                test_error <= '1';
                report "Computed values do not match expected ones" severity error;
            end if;
            wait for PERIOD;
            test_error <= '0';
            wait for PERIOD;
        end loop;
        report "End of the test." severity note;
        wait;
end process;
    
end behavioral;