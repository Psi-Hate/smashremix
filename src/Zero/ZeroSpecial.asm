// ZeroSpecial.asm

// This file contains subroutines used by Zero's special moves.

// @ Description
// Subroutines for Up Special    
scope ZeroUSP {
    // floating point constants for physics and fsm
    constant AIR_Y_SPEED(0x43C8)            // current setting - float32 400
    constant GROUND_Y_SPEED(0x43D2)         // current setting - float32 420
    constant GROUND_SPEED(0x42A0)           // float32 80
    constant X_SPEED(0x4120)                // current setting - float32 10
    constant END_AIR_ACCELERATION(0x3C20)   // current setting - float32 0.00977
    constant END_AIR_SPEED(0x41C0)          // current setting - float32 24
    constant LANDING_FSM(0x3EC0)            // current setting - float32 0.375
    // temp variable 3 constants for movement states
    constant BEGIN(0x1)
    constant BEGIN_MOVE(0x2)
    constant MOVE(0x3)
    constant END_MOVE(0x4)
    constant END(0x5)
    
    // @ Description
    // Subroutine which runs when Marth initiates an aerial up special.
    // Changes action, and sets up initial variable values.
    // @ Description
    // Initial subroutine for USP while grounded.
    scope ground_initial_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      ra, 0x0014(sp)              // ~
        sw      a0, 0x0018(sp)              // store ra, a0
        lw      a0, 0x0084(a0)              // a0 = player struct
        lli     a1, 0xEB                    // a1(action id) = USP
        lui     at, GROUND_SPEED            // at = GROUND_SPEED
        jal     0x800DEEC8                  // set aerial state
        sw      at, 0x004C(a0)              // y velocity = GROUND_SPEED
        jal     air_initial_                // transition to USP
        lw      a0, 0x0018(sp)              // a0 = player object
        lw      ra, 0x0014(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0028              // deallocate stack space
    }

    // @ Description
    // Initial subroutine for USP.
    scope air_initial_: {
        addiu   sp, sp, 0xFFE0              // ~
        sw      ra, 0x001C(sp)              // ~
        sw      a0, 0x0020(sp)              // original lines 1-3
        sw      r0, 0x0010(sp)              // argument 4 = 0
        lli     a1, 0xEE                    // a1 = Action.USPA
        or      a2, r0, r0                  // a2 = float: 0.0
        jal     0x800E6F24                  // change action
        lui     a3, 0x3F80                  // a3 = float: 1.0
        jal     0x800E0830                  // unknown common subroutine
        lw      a0, 0x0020(sp)              // a0 = player object
        lw      a0, 0x0020(sp)              // ~
        lw      a0, 0x0084(a0)              // a0 = player struct
        sw      r0, 0x017C(a0)              // temp variable 1 = 0
        sw      r0, 0x0180(a0)              // temp variable 2 = 0
        ori     v1, r0, 0x0001              // ~
        sw      v1, 0x0184(a0)              // temp variable 3 = 0x1(BEGIN)
        // reset fall speed
        lbu     v1, 0x018D(a0)              // v1 = fast fall flag
        ori     t6, r0, 0x0007              // t6 = bitmask (01111111)
        and     v1, v1, t6                  // ~
        sb      v1, 0x018D(a0)              // disable fast fall flag
        // freeze y position
        lw      v1, 0x09C8(a0)              // v1 = attribute pointer
        lw      v1, 0x0058(v1)              // v1 = gravity
        sw      v1, 0x004C(a0)              // y velocity = gravity
        lw      ra, 0x001C(sp)              // ~
        addiu   sp, sp, 0x0020              // ~
        jr      ra                          // original return logic
        nop
    }
    
    // @ Description
    // Main subroutine for Marth's up special.
    // Based on subroutine 0x8015C750, which is the main subroutine of Fox's up special ending.
    // Modified to load Marth's landing FSM value and disable the interrupt flag.
    scope main_: {
        // Copy the first 8 lines of subroutine 0x8015C750
        OS.copy_segment(0xD7190, 0x20)
        bc1fl   _end                        // skip if animation end has not been reached
        lw      ra, 0x0024(sp)              // restore ra
        sw      r0, 0x0010(sp)              // unknown argument = 0
        sw      r0, 0x0018(sp)              // interrupt flag = FALSE
        lui     t6, LANDING_FSM             // t6 = LANDING_FSM
        jal     0x801438F0                  // begin special fall
        sw      t6, 0x0014(sp)              // store LANDING_FSM
        lw      ra, 0x0024(sp)              // restore ra
        
        _end:
        addiu   sp, sp, 0x0028              // deallocate stack space
        jr      ra                          // return
        nop
    }
    
    // @ Description
    // Subroutine which allows a direction change for Marth's up special.
    // Uses the moveset data command 580000XX (orignally identified as "set flag" by toomai)
    // This command's purpose appears to be setting a temporary variable in the player struct.  
    // Variable values used by this subroutine:
    // 0x2 = change direction
    scope interrupt_: {
        addiu   sp, sp, -0x0020             // allocate stackspace
        sw      ra, 0x001C(sp)              // store ra
        sw      a0, 0x0018(sp)              // store player obj
        lw      t0, 0x0084(a0)              // t0 = player struct
        lw      at, 0x0180(t0)              // at = temp variable 2
        
        lw      t0, 0x0084(a0) // t0 = player struct
        lw      at, 0x01BE(t0) // at = buttons_pressed
        andi    at, at, Joypad.B
        bnez    at, _cancel    // branch if A, B, or Z is pressed
        lb      at, 0x01C3(t0) // at = stick_y
        addiu   at, at, 10     // at = stick_y + deadzone
        bgez    at, _end       // skip if stick_y + deadzone >= 0
        nop

        _cancel:
        jal     0x801438F0                  // transition to Special Fall
        sw      at, 0x0014(sp)              // store landing fsm

        _end:
        lw      ra, 0x0020(sp)              // load ra
        jr      ra                          // return
        addiu   sp, sp, 0x0028              // deallocate stack space
    }
    
    // @ Description
    // Subroutine which handles movement for Marth's up special.
    // Uses the moveset data command 5C0000XX (orignally identified as "apply throw?" by toomai)
    // This command's purpose appears to be setting a temporary variable in the player struct.
    // The most common use of this variable is to determine when a throw should be applied.
    // Variable values used by this subroutine:
    // 0x2 = begin movement
    // 0x3 = movement
    // 0x4 = end movement
    // 0x5 = ending
    scope physics_: {
        // s0 = player struct
        // s1 = attributes pointer
        // 0x184 in player struct = temp variable 3
        addiu   sp, sp,-0x0038              // allocate stack space
        sw      ra, 0x001C(sp)              // ~
        sw      s0, 0x0014(sp)              // ~
        sw      s1, 0x0018(sp)              // original store registers
        sw      t0, 0x0024(sp)              // ~
        sw      t1, 0x0028(sp)              // ~
        swc1    f0, 0x002C(sp)              // ~
        swc1    f2, 0x0030(sp)              // ~
        swc1    f4, 0x0034(sp)              // store t0, t1, f0, f2, f4
        
        lw      s0, 0x0084(a0)              // s0 = player struct
        lw      t0, 0x014C(s0)              // t0 = kinetic state
        bnez    t0, _aerial                 // branch if kinetic state !grounded
        nop
        
        //_grounded:
        jal     0x800D8BB4                  // grounded physics subroutine
        nop
        b       _end                        // end subroutine
        nop
        
        _aerial:
        OS.copy_segment(0x548F0, 0x40)      // copy from original air physics subroutine
        bnez    v0, _check_begin            // modified original branch
        nop
        li      t8, 0x800D8FA8              // t8 = subroutine which disallows air control
        lw      t0, 0x0184(s0)              // t0 = temp variable 3
        ori     t1, r0, END                 // t1 = END
        bne     t0, t1, _apply_air_physics  // branch if temp variable 3 != END
        nop
        li      t8, air_control_             // t8 = air_control_
        
        _apply_air_physics:
        or      a0, s0, r0                  // a0 = player struct
        jalr    t8                          // air control subroutine
        or      a1, s1, r0                  // a1 = attributes pointer
        or      a0, s0, r0                  // a0 = player struct
        jal     0x800D9074                  // air friction subroutine?
        or      a1, s1, r0                  // a1 = attributes pointer
        
        _check_begin:
        lw      t0, 0x0184(s0)              // t0 = temp variable 3
        ori     t1, r0, BEGIN               // t1 = BEGIN
        bne     t0, t1, _check_begin_move   // skip if temp variable 3 != BEGIN
        lw      t0, 0x0024(s0)              // t0 = current action
        lli     t1, 0xEB                    // t1 = Action.USPG
        beq     t0, t1, _check_begin_move   // skip if current action = USP_GROUND
        nop
        // slow x movement
        lwc1    f0, 0x0048(s0)              // f0 = current x velocity
        lui     t0, 0x3F60                  // ~
        mtc1    t0, f2                      // f2 = 0.875
        mul.s   f0, f0, f2                  // f0 = x velocity * 0.875
        swc1    f0, 0x0048(s0)              // x velocity = (x velocity * 0.875)
        // freeze y position
        sw      r0, 0x004C(s0)              // y velocity = 0
        
        _check_begin_move:
        lw      t0, 0x0184(s0)              // t0 = temp variable 3
        ori     t1, r0, BEGIN_MOVE          // t1 = BEGIN_MOVE
        bne     t0, t1, _check_end_move     // skip if temp variable 3 != BEGIN_MOVE
        nop
        // initialize x/y velocity
        lw      t0, 0x0024(s0)              // t0 = current action
        lli     t1, 0xEB                    // t1 = Action.USPG
        beq     t0, t1, _calculate_velocity // branch if current action = USP_GROUND
        lui     t0, GROUND_Y_SPEED          // t0 = GROUND_Y_SPEED
        // if current action != USP_GROUND
        lui     t0, AIR_Y_SPEED             // t0 = AIR_Y_SPEED
        
        _calculate_velocity:
        mtc1    t0, f4                      // f4 = Y_SPEED
        lwc1    f0, 0x0044(s0)              // ~
        cvt.s.w f0, f0                      // f0 = direction
        lb      t0, 0x01C2(s0)              // ~
        mtc1    t0, f2                      // ~         
        cvt.s.w f2, f2                      // f2 = stick_x
        mul.s   f0, f2, f0                  // f0 = stick_x * direction
        lui     t0, 0x4120                  // ~
        mtc1    t0, f2                      // f2 = 10
        c.le.s  f2, f0                      // ~
        nop                                 // ~
        bc1f    _apply_movement             // branch if stick_x * direction =< 10
        nop
        
        // update x velocity based on stick_x
        // f0 = stick_x (relative to direction)
        lui     t0, 0x4000                  // ~
        mtc1    t0, f2                      // f2 = 2
        mul.s   f2, f0, f2                  // f2 = x velocity (stick_x * 2)
        // update y velocity based on x velocity (higher x = lower y)
        lui     t0, 0x3F00                  // ~
        mtc1    t0, f0                      // f0 = 0.375
        mul.s   f0, f0, f2                  // ~
        sub.s   f4, f4, f0                  // f4 = Y_SPEED - (x velocity * 0.375)
        
        _apply_movement:
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
        
        _check_end_move:
        lw      t0, 0x0184(s0)              // t0 = temp variable 3
        ori     t1, r0, END_MOVE            // t1 = END_MOVE
        bne     t0, t1, _end                // skip if temp variable 3 != END_MOVE
        nop
        
        _end_movement:
        // slow x movement
        lwc1    f0, 0x0048(s0)              // f0 = current x velocity
        lui     t0, 0x3E00                  // ~
        mtc1    t0, f2                      // f2 = 0.125
        mul.s   f0, f0, f2                  // f0 = x velocity * 0.125
        lui     t0, X_SPEED                 // ~
        mtc1    t0, f2                      // f2 = X_SPEED
        lwc1    f4, 0x0044(s0)              // ~
        cvt.s.w f4, f4                      // f4 = direction
        mul.s   f2, f2, f4                  // f2 = X_SPEED * direction
        add.s   f0, f0, f2                  // f0 = final velocity
        swc1    f0, 0x0048(s0)              // x velocity = (x velocity * 0.125) + X_SPEED
        // slow y movement
        lwc1    f0, 0x004C(s0)              // f0 = current y velocity
        lui     t0, 0x3DC0                  // ~
        mtc1    t0, f2                      // f2 = 0.09375
        mul.s   f0, f0, f2                  // f0 = y velocity * 0.09375
        swc1    f0, 0x004C(s0)              // y velocity = (y velocity * 0.09375)
        ori     t0, r0, END                 // t0 = END
        sw      t0, 0x0184(s0)              // temp variable 3 = END
        
        _end:
        lw      t0, 0x0024(sp)              // ~
        lw      t1, 0x0028(sp)              // ~
        lwc1    f0, 0x002C(sp)              // ~
        lwc1    f2, 0x0030(sp)              // ~
        lwc1    f4, 0x0034(sp)              // load t0, t1, f0, f2, f4
        lw      ra, 0x001C(sp)              // ~
        lw      s0, 0x0014(sp)              // ~
        lw      s1, 0x0018(sp)              // original load registers
        addiu   sp, sp, 0x0038              // deallocate stack space
        jr      ra                          // return
        nop
    }
    
    // @ Description
    // Subroutine which handles Marth's horizontal control for up special.
    scope air_control_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      a1, 0x001C(sp)              // ~
        sw      ra, 0x0014(sp)              // ~
        sw      t0, 0x0020(sp)              // ~
        sw      t1, 0x0024(sp)              // store a1, ra, t0, t1
        addiu   a1, r0, 0x0008              // a1 = 0x8 (original line)
        lw      t6, 0x001C(sp)              // t6 = attribute pointer
        // load an immediate value into a2 instead of the air acceleration from the attributes
        lui     a2, END_AIR_ACCELERATION    // a2 = END_AIR_ACCELERATION
        lui     a3, END_AIR_SPEED           // a3 = END_AIR_SPEED
        jal     0x800D8FC8                  // air drift subroutine?
        nop
        lw      ra, 0x0014(sp)              // ~
        lw      t0, 0x0020(sp)              // ~
        lw      t1, 0x0024(sp)              // load ra, t0, t1
        addiu   sp, sp, 0x0028              // deallocate stack space
        jr      ra                          // return
        nop
    }
    
    // @ Description
    // Subroutine which handles collision for Marth's up special.
    // Copy of subroutine 0x80156358, which is the collision subroutine for Mario's up special.
    // Loads the appropriate landing fsm value for Marth.
    scope collision_: {
        // Copy the first 30 lines of subroutine 0x80156358
        OS.copy_segment(0xD0D98, 0x78)
        // Replace original line which loads the landing fsm
        //lui     a2, 0x3E8F                // original line 1
        lui     a2, LANDING_FSM             // a2 = LANDING_FSM
        // Copy the last 17 lines of subroutine 0x80156358
        OS.copy_segment(0xD0E14, 0x44)
    }
}
