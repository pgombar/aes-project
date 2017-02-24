----------------------------------------------------------------------------------
-- Engineer: Pedro Maat C. Massolino
-- 
-- Create Date:    28/11/2016
-- Design Name:    TestBench_AES_MixColumns
-- Module Name:    TestBench_AES_MixColumns
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

entity tb_aes_mixcolumns is
    Generic(
        PERIOD : time := 100 ns;
        number_of_encryption_tests : integer := 9
    );
end tb_aes_mixcolumns;

architecture behavioral of tb_aes_mixcolumns is

component aes_mixcolumns
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
X"E598271EF11141B8AE52B4E0305DBFD4",
X"1A96DE77F1D2027F895339453B87DB49",
X"B5117345DFCF23137B5AB5EFB8D6C1AC",
X"075E50F6D72FCFE3286A118594C8A452",
X"53FB4F97BAD26C359BAEC8E87C96FBE1",
X"2329634CDFA8D510FC03E878FE3D4FA1",
X"D3A9AB54FF31B59BF03D43273F4083F7",
X"4D8683DAC02C640AC8F2E1D4FED43BBE",
X"95C3EC97D84A904D8CE74CF2A6466E87");

constant test_output_enc : test_array(1 to number_of_encryption_tests) := (
X"4C2606287AD3F8489A19CBE0E5816604",
X"E5B06B1BA8CAE7DBAC5A4B1BF1CA4D58",
X"DCD025BB7CCFC05333630B209309EC75",
X"0113B35E6B10C06FBF383160A9DAD60F",
X"B0C04C4C8E333AB668D111BDADA9D125",
X"D818D237E8F49D3380894A2C6D8D864B",
X"43D82A34D7564627EC151646BFB51514",
X"EA991BFACD6D7654FF89C8B1D12F5100",
X"BC429F4CA63A70A3A5E4D440ED943747");


begin

test : aes_mixcolumns
    Port Map(
        a => test_a,
        enc_dec => test_enc_dec,
        o => test_o
    );
    
    
process
    begin
        report "Start MixColumns encryption test." severity note;
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
        report "Start MixColumns decryption test." severity note;
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