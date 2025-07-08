* Little program to copy segment of disk ROM to low ram 
* so it can be SAVEM to disk
*
* It is MPI, SDC aware.
* Requires CoCo 3
*

init0 equ $ff90 ; coco 3 hardware register
mpi equ $ff7f
type_rom equ $ffde ; set ROM mode
type_ram equ $ffdf ; set RAM mode

 org $5000
sdc rmb 1
fdc rmb 1
seg rmb 1
 
start
* Turn on 32k ROM mode
 lda #3
 sta init0
 sta type_rom
 
* Set MPIs SCS to point to FDC slot
 lda fdc
 lsla
 lsla
 lsla
 lsla
 ora fdc
 sta mpi 
 
* calculate which segment
 lda #$20
 ldb seg
 mul
 exg a,b
 ldx #$8000
 leax d,x
 ldy #$6000
 
* copy segmenet
loop
 ldd ,x++
 std ,y++
 
 cmpx #$ff00
 beq copy_zeros ; don't copy hardware i/o

 cmpy #$8000
 beq done ; don't copy more than 8k
 bra loop
 
done
* restore MPI
 lda sdc
 lsla
 lsla
 lsla
 lsla
 ora sdc
 sta mpi 

* retore RAM mode
 lda #$cc
 sta type_ram
 sta init0

* return
 rts
 
copy_zeros
 ldd #$ffff
loop_cz 
 std ,y++
 cmpy #$8000
 beq done
 bra loop_cz
 
 end start