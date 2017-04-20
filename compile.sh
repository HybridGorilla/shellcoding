#/bin/bash
name=$(echo $1 | sed 's/\.nasm//')
echo '[+] Assembling with Nasm ... '
nasm -f elf32 -o $name.o $name.nasm

echo '[+] Linking ...'
ld -m elf_i386 -o $name $name.o

echo '[+] Done!'



