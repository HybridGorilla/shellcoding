#!/bin/bash
#source is http://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump
#It reads the binary from a command line arg, hilights the null bytes and prints the length
if [ "$#" -ne 1 ]; then
    echo "usage: ./bin2sc [binary]"
    exit
fi

shellcode=$(objdump -d $1|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g')
echo  "[+] shellcode" 
echo $shellcode | grep "x00" --color=auto
echo -n "[+] length: "
echo -n $shellcode | tr \\ "\n" 2>/dev/null | wc -l
