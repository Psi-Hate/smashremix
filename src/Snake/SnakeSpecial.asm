// SnakeSpecial.asm

// This file contains subroutines used by Snake's special moves.

scope SnakeUSP {
    constant MAX_TIME(240)
    constant CANCEL_TIME(100)

    // @ Description
    // Initial subroutine for USP.
    scope begin_initial_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      ra, 0x0014(sp)              // ~
        sw      a0, 0x0018(sp)              // store ra, a0
        
        lw      a1, 0x0084(a0)              // a1 = player struct
        lw      at, 0x0ADC(a1)              // at = down b flag
        bnez    at, _end                    // skip if down b flag != 0
        lli     at, OS.TRUE                 // ~
        sw      at, 0x0ADC(a1)              // down b flag = TRUE
        
        lli     a1, 0xEB                    // a1(action id) = USPAir
        or      a2, r0, r0                  // a2(starting frame) = 0
        lui     a3, 0x3F80                  // a3(frame speed multiplier) = 1.0
        jal     0x800E6F24                  // change action
        sw      r0, 0x0010(sp)              // argument 4 = 0

        _end:
        lw      ra, 0x0014(sp)              // load ra
        addiu   sp, sp, 0x0028              // deallocate stack space
        jr      ra                          // return
        nop

    }

    // @ Description
    // Initial subroutine for USP.
    scope air_initial_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      ra, 0x0014(sp)              // ~
        sw      a0, 0x0018(sp)              // store ra, a0
        
        lw      a1, 0x0084(a0)              // a1 = player struct
        lw      at, 0x0ADC(a1)              // at = down b flag
        bnez    at, _end                    // skip if down b flag != 0
        lli     at, OS.TRUE                 // ~
        sw      at, 0x0ADC(a1)              // down b flag = TRUE
        
        lli     a1, 0xEE                    // a1(action id) = USPAir
        or      a2, r0, r0                  // a2(starting frame) = 0
        lui     a3, 0x3F80                  // a3(frame speed multiplier) = 1.0
        jal     0x800E6F24                  // change action
        sw      r0, 0x0010(sp)              // argument 4 = 0

        _end:
        lw      ra, 0x0014(sp)              // load ra
        addiu   sp, sp, 0x0028              // deallocate stack space
        jr      ra                          // return
        nop

    }

    // @ Description
    // Main function for USP
    scope main_: {
        addiu   sp, sp,-0x0030              // allocate stack space
        sw      ra, 0x0024(sp)              // store ra
        lw      v1, 0x0084(a0)              // v1 = player struct
        lw      t6, 0x0B18(v1)              // t6 = frame timer
        slti    at, t6, MAX_TIME            // at = 1 if frame timer < MAX_TIME, else at = 0
        addiu   t6, t6, 0x0001              // ~
        bnez    at, _end                    // branch if frame timer < MAX_TIME
        sw      t6, 0x0B18(v1)              // increment frame timer

        // if frame timer has reached MAX_TIME
        jal     usp_cancel_
        nop

        _end:
        lw      ra, 0x0024(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0030              // deallocate stack space
    }
    
    // @ Description
    // Subroutine for aerial up special interrupt.
    scope interrupt_: {
        addiu   sp, sp, -0x0020             // allocate stackspace
        sw      ra, 0x001C(sp)              // store ra
        sw      a0, 0x0018(sp)              // store player obj
        lw      t0, 0x0084(a0)              // t0 = player struct
        lw      at, 0x0180(t0)              // at = temp variable 2
        lw      t6, 0x0B18(v1)              // t6 = frame timer
        slti    at, t6, CANCEL_TIME         // at = 1 if frame timer < CANCEL_TIME, else at = 0
        addiu   t6, t6, 0x0001              // ~
        bnez    at, _end                    // branch if frame timer < CANCEL_TIME
        sw      t6, 0x0B18(v1)              // increment frame timer

        // if here, frame timer = CANCEL_TIME
        jal     0x80150B00                  // check for aerial attacks
        sw      a0, 0x0018(sp)              // 0x0018(sp) = player object
        bnezl   v0, _end                    // end if aerial attack initiated
        
    //    _allow_input:
   //     lw      at, 0x01BE(t0) // at = buttons_pressed
   //     andi    at, at, Joypad.A | Joypad.B | Joypad.Z
   //     bnez    at, usp_fall_    // branch if A, B, or Z is pressed
        lw      t0, 0x0084(a0) // t0 = player struct
        lb      at, 0x01C3(t0) // at = stick_y
        addiu   at, at, 69     // at = stick_y + deadzone
        bgez    at, _end       // skip if stick_y + deadzone >= 0
        nop


        // if here, set to special fall.
        jal     usp_cancel_
        nop

        _end:
        lw      ra, 0x001C(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0020              // deallocation stackspace in delay slot
    }
    
    // @ Description
    // cancel Snakes USP into special fall
    scope usp_fall_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      ra, 0x0020(sp)              // store ra
        lui     at, 0x3F80                  // landing fsm
        lui     a1, 0x3F80                  // a1 (drift multiplier?) = 1.0
        or      a2, r0, r0                  // a2 (unknown) = 0
        lli     a3, 0x0001                  // a3 (unknown) = 1
        sw      r0, 0x0010(sp)              // unknown argument = 0
        sw      r0, 0x0018(sp)              // interrupt flag = FALSE

        jal     0x800DEE54                  // transition to idle
        sw      at, 0x0014(sp)              // store landing fsm

        _end:
        lw      ra, 0x0020(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0028              // deallocate stack space
    }

    // @ Description
    // cancel Snakes USP into special fall
    scope usp_cancel_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      ra, 0x0020(sp)              // store ra
        lui     at, 0x3F80                  // landing fsm
        lui     a1, 0x3F80                  // a1 (drift multiplier?) = 1.0
        or      a2, r0, r0                  // a2 (unknown) = 0
        lli     a3, 0x0001                  // a3 (unknown) = 1
        sw      r0, 0x0010(sp)              // unknown argument = 0
        sw      r0, 0x0018(sp)              // interrupt flag = FALSE

        jal     0x800DEE54                  // transition to idle
        sw      at, 0x0014(sp)              // store landing fsm

        _end:
        lw      ra, 0x0020(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0028              // deallocate stack space
    }
}
