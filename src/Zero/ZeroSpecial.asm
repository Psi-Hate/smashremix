// ZeroSpecial.asm

// This file contains subroutines used by Zero's special moves.

scope ZeroJAB2 {
    constant MAX_TIME(10)

    // @ Description
    // Interupt subroutine for Jab2.
    scope interrupt_: {
        addiu   sp, sp,-0x0030              // allocate stack space
        sw      ra, 0x0024(sp)              // store ra
        lw      v1, 0x0084(a0)              // v1 = player struct
        lw      t6, 0x0B18(v1)              // t6 = frame timer
        slti    at, t6, MAX_TIME            // at = 1 if frame timer < MAX_TIME, else at = 0
        addiu   t6, t6, 0x0001              // ~
        bnez    at, _end                    // branch if frame timer < MAX_TIME
        sw      t6, 0x0B18(v1)              // increment frame timer

        // begin by checking for A and B presses
        lhu     v0, 0x01BE(a1)              // v0 = buttons_pressed
        andi    at, v0, Joypad.A // at = !0 if (A_PRESSED), else t6 = 0
        beqz    at, _end           // branch if both A and B are not being pressed
        nop

        // If here, A was pressed

        jal     0x800DEE54                  // transition to idle
        nop

        _end:
        lw      ra, 0x0024(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0030              // deallocate stack space
        
    }
}
