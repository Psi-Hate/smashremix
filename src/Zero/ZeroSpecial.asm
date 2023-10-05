// ZeroSpecial.asm

// This file contains subroutines used by Zero's special moves.

scope ZeroDASH {
    constant X_SPEED(0x4120)                // current setting - float32 10
    constant MOVE(0x3)

    // @ Description
    // Interupt subroutine for Dash.
    scope interrupt_: {
        addiu   sp, sp,-0x0030              // allocate stack space
        sw      ra, 0x0024(sp)              // store ra
        lw      v1, 0x0084(a0)              // v1 = player struct
        lw      t6, 0x0B18(v1)              // t6 = frame timer

        // begin by checking for A and B presses
        lhu     v0, 0x01BE(a1)              // v0 = buttons_pressed
        andi    at, v0, Joypad.CL | Joypad.CR // at = !0 if (JUMPING), else t6 = 0
        beqz    at, _end           // branch if not jumping
        nop

        // If here, Jump was initiated

        // f2 = x velocity to add
        // f4 = y velocity
        lui     t0, X_SPEED                 // ~
        mtc1    t0, f0                      // f0 = X_SPEED
        add.s   f2, f2, f0                  // f2 = final velocity
        lwc1    f0, 0x0044(s0)              // ~
        cvt.s.w f0, f0                      // f0 = direction
        mul.s   f2, f0, f2                  // f2 = x velocity * direction
        swc1    f2, 0x0048(s0)              // store x velocity
        swc1    f4, 0x004C(s0)              // store y velocity
        ori     t0, r0, MOVE                // t0 = MOVE
        sw      t0, 0x0184(s0)              // temp variable 3 = MOVE
        // take mid-air jumps away at this point
        lw      t0, 0x09C8(s0)              // t0 = attribute pointer
        lw      t0, 0x0064(t0)              // t0 = max jumps
        sb      t0, 0x0148(s0)              // jumps used = max jumps
        nop

        _end:
        lw      ra, 0x0024(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0030              // deallocate stack space
        
    }
}
