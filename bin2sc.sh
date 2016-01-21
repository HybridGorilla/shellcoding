#!/bin/bash
#source is http://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump
#I just made the program name an input 
if [ "$#" -ne 1 ]; then
    echo "usage: ./bin2sc [binary]"
    exit
fi

objdump -d $1|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
