#!/bin/sh
set -v

lwasm -o diskrom.bin -ldiskrom.lst diskrom.asm
decb dskini diskrom.dsk
decb copy -2b diskrom.bin diskrom.dsk,DISKROM.BIN
decb copy -t diskrom.txt diskrom.dsk,DISKROM.BAS
