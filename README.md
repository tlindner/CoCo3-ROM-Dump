# CoCo3-ROM-Dump
Quick and dirty program for using a CoCo 3 to dump external ROM cartridges.

This program runs on a CoCo 3. Check the GitHub releases and download the disk image.

Hardware requirements are:
1. CoCo 3
2. Multi-Pak Interface
3. Floppy disk controller

If you are trying the dump a ROM from a floppy disk controller, there is no need for a Multi-Pak Interface.

Setup up your CoCo 3 system insert the disk and `RUN "DISKROM"`.

You will be asked to describe where the cartridges are slotted into your Multi-Pak Interface. Then the program will create four ROM files on the disk in drive 0.

The four ROM file will be 8 kiB segments of the 32k ROM space available to the CoCo 3.

The last 256 bytes of a ROM will be $FF, because I can't be bothered to use the more advanced method that makes them available.

tim lindner

tlindner@macmess.org

July 2025
