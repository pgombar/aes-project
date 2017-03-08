# aes-project

Source code of the first assignment from the course [Cryptographic Engineering](https://sis.ru.nl/osiris-student/OnderwijsCatalogusSelect.do?selectie=cursus&collegejaar=2016&cursus=NWI-IMC039&taal=en), offered at Radboud University, handed out by [Pedro Maat Costa Massolino](https://www.cs.ru.nl/staff/Pedro.Maat.Costa.Massolino).

The aim of this exercise is to get familiar with digital circuit design for the AES block cipher, written in VHDL.

The task is to optimize the key generation routine. This is done by generating keys on the fly, instead of having a memory that holds all round keys.

## Prerequisites
- [GHDL](https://github.com/tgingold/ghdl/releases)
- [GTKWave](https://sourceforge.net/projects/gtkwave/)


## Installation
```
cd vhdl_source
make test_core
```

## Simulation
```
gtkwave tb_aes128_core.ghw
```
