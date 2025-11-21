.section .text
.global _start

_start:
    # Initialize Global Pointer
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # Initialize Stack Pointer
    la sp, _stack_top

    # Clear BSS section
    la t0, _bss_start
    la t1, _bss_end
    bge t0, t1, main_entry

clear_bss_loop:
    sw zero, 0(t0)
    addi t0, t0, 4
    blt t0, t1, clear_bss_loop

main_entry:
    # Jump to C main function
    call main

    # Hang if main returns
loop:
    j loop
