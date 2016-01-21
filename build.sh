##!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "usage: ./build [myfile.nasm]"
    exit
fi

if [[ $1 == *.nasm ]]; then
	if [ ! -f $1 ]; then
    		echo "[error] nasm file not found"
		exit
	fi
	echo "[+] building $1"
	echo "[+] build executable to: $1" | sed 's/.nasm//'
	nasm -f elf $1 -o bind-shell.o
	ld bind-shell.o -o bind-shell
	echo -e "\n\n[syscalls]"
	strace ./bind-shell
	exit 
else
	echo "[error] you must specify a file ending with .nasm"
	exit
fi

