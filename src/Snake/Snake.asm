// J Falcon.asm

// This file contains file inclusions, action edits, and assembly for J Captain Falcon.

scope Snake {
    // Insert Moveset files
    // insert NEUTRAL2, "moveset/NEUTRAL2.bin"
    // insert NEUTRAL3, "moveset/NEUTRAL3.bin"
    insert WIN2, "moveset/WIN2.bin"
    insert BOX, "moveset/BOX.bin"
    insert CSS, "moveset/CSS.bin"
    insert IDLE, "moveset/IDLE.bin"
    insert JAB1, "moveset/JAB1.bin"
    insert JAB2, "moveset/JAB2.bin"
    insert JAB3, "moveset/JAB3.bin"
    insert DASH, "moveset/DASH.bin"
    insert FTILT, "moveset/FTILT.bin"
    insert UTILT, "moveset/UTILT.bin"
    insert DTILT, "moveset/DTILT.bin"
    insert SMASHF, "moveset/SMASHF.bin"
    insert AIRD, "moveset/AIRD.bin"
    insert AIRF, "moveset/AIRF.bin"
    insert AIRU, "moveset/AIRU.bin"
    insert AIRB, "moveset/AIRB.bin"
    insert AIRN, "moveset/AIRN.bin"
    insert SPU, "moveset/SPU.bin"
    insert THROWB_DATA,"moveset/THROWB_DATA.bin"
    THROWB:; Moveset.THROW_DATA(THROWB_DATA); insert "moveset/THROWB.bin"
    insert THROWF_DATA,"moveset/THROWF_DATA.bin"
    THROWF:; Moveset.THROW_DATA(THROWF_DATA); insert "moveset/THROWF.bin"

    // Modify Action Parameters             // Action               // Animation                // Moveset Data             // Flags
    Character.edit_action_parameters(SNAKE, Action.Entry,                  File.SNAKE_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, 0x006,                         File.SNAKE_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Revive2,                File.SNAKE_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ReviveWait,             File.SNAKE_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Idle,                   File.SNAKE_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Walk1,                  File.SNAKE_WALK1,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Walk2,                  File.SNAKE_WALK2,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Walk3,                  File.SNAKE_WALK3,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, 0x00E,                         File.SNAKE_WALKEND,               -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Dash,                   File.SNAKE_DASH,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Run,                    File.SNAKE_RUN,                   -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.RunBrake,               File.SNAKE_RUNBRAKE,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Turn,                   File.SNAKE_TURN,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.TurnRun,                File.SNAKE_TURNRUN,               -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.JumpSquat,              File.SNAKE_JUMPSQUAT,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ShieldJumpSquat,        File.SNAKE_JUMPSQUAT,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.JumpF,                  File.SNAKE_JUMPF,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.JumpB,                  File.SNAKE_JUMPB,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.JumpAerialF,            File.SNAKE_JUMPAERIALF,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.JumpAerialB,            File.SNAKE_JUMPAERIALB,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Fall,                   File.SNAKE_FALL,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FallAerial,             File.SNAKE_FALLAERIAL,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Crouch,                 File.SNAKE_CROUCH,                -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CrouchIdle,             File.SNAKE_CROUCHIDLE,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CrouchEnd,              File.SNAKE_CROUCHEND,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.LandingLight,           File.SNAKE_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.LandingHeavy,           File.SNAKE_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Pass,                   File.SNAKE_PLATDROP,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ShieldDrop,             File.SNAKE_PLATDROP,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Teeter,                 File.SNAKE_TEETER,                -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.TeeterStart,            File.SNAKE_TEETERSTART,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FallSpecial,            File.SNAKE_FALLSPECIAL,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.LandingSpecial,         File.SNAKE_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Tornado,                File.SNAKE_TUMBLE,                -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.EnterPipe,              File.SNAKE_ENTERPIPE,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ExitPipe,               File.SNAKE_EXITPIPE,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ExitPipeWalk,           File.SNAKE_EXITPIPEWALK,          -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CeilingBonk,            File.SNAKE_CEILINGBONK,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownStandD,             File.SNAKE_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownStandU,             File.SNAKE_DOWNSTANDU,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.TechF,                  File.SNAKE_TECHF,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.TechB,                  File.SNAKE_TECHB,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownForwardD,           File.SNAKE_DOWNFORWARDD,          -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownForwardU,           File.SNAKE_DOWNFORWARDU,          -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownBackD,              File.SNAKE_DOWNBACKD,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownBackU,              File.SNAKE_DOWNBACKU,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownAttackD,            File.SNAKE_DOWNATTACKD,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DownAttackU,            File.SNAKE_DOWNATTACKU,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Tech,                   File.SNAKE_TECH,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ClangRecoil,            File.SNAKE_CLANGRECOIL,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CliffClimbQuick2,       File.SNAKE_CLIFFCLIMBQUICK2,      -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CliffClimbSlow2,        File.SNAKE_CLIFFCLIMBSLOW2,       -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CliffAttackQuick2,      File.SNAKE_CLIFFATTACKQUICK2,     -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CliffAttackSlow2,       File.SNAKE_CLIFFATTACKSLOW2,      -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CliffEscapeQuick2,      File.SNAKE_CLIFFESCAPEQUICK2,     -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.CliffEscapeSlow2,       File.SNAKE_CLIFFESCAPESLOW2,      -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.LightItemPickup,        File.SNAKE_LIGHTITEMPICKUP,       -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HeavyItemPickup,        File.SNAKE_HEAVYITEMPICKUP,       -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemDrop,               File.SNAKE_ITEMDROP,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowDash,          File.SNAKE_ITEMTHROWDASH,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowF,             File.SNAKE_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowB,             File.SNAKE_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowU,             File.SNAKE_ITEMTHROWU,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowD,             File.SNAKE_ITEMTHROWD,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowSmashF,        File.SNAKE_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowSmashB,        File.SNAKE_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowSmashU,        File.SNAKE_ITEMTHROWU,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowSmashD,        File.SNAKE_ITEMTHROWD,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirF,          File.SNAKE_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirB,          File.SNAKE_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirU,          File.SNAKE_ITEMTHROWAIRU,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirD,          File.SNAKE_ITEMTHROWAIRD,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirSmashF,     File.SNAKE_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirSmashB,     File.SNAKE_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirSmashU,     File.SNAKE_ITEMTHROWAIRU,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ItemThrowAirSmashD,     File.SNAKE_ITEMTHROWAIRD,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HeavyItemThrowF,        File.SNAKE_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HeavyItemThrowB,        File.SNAKE_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HeavyItemThrowSmashF,   File.SNAKE_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HeavyItemThrowSmashB,   File.SNAKE_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BeamSwordNeutral,       File.SNAKE_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BeamSwordTilt,          File.SNAKE_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BeamSwordSmash,         File.SNAKE_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BeamSwordDash,          File.SNAKE_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BatNeutral,             File.SNAKE_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BatTilt,                File.SNAKE_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BatSmash,               File.SNAKE_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.BatDash,                File.SNAKE_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FanNeutral,             File.SNAKE_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FanTilt,                File.SNAKE_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FanSmash,               File.SNAKE_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FanDash,                File.SNAKE_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.StarRodNeutral,         File.SNAKE_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.StarRodTilt,            File.SNAKE_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.StarRodSmash,           File.SNAKE_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.StarRodDash,            File.SNAKE_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.RayGunShoot,            File.SNAKE_ITEMSHOOT,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.RayGunShootAir,         File.SNAKE_ITEMSHOOTAIR,          -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FireFlowerShoot,        File.SNAKE_ITEMSHOOT,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FireFlowerShootAir,     File.SNAKE_ITEMSHOOTAIR,          -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HammerIdle,             File.SNAKE_HAMMERIDLE,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HammerWalk,             File.SNAKE_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HammerTurn,             File.SNAKE_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HammerJumpSquat,        File.SNAKE_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HammerAir,              File.SNAKE_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.HammerLanding,          File.SNAKE_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ShieldOn,               File.SNAKE_SHIELDON,              -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.ShieldOff,              File.SNAKE_SHIELDOFF,             -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.RollF,                  File.SNAKE_ROLLF,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.RollB,                  File.SNAKE_ROLLB,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.StunStartD,             File.SNAKE_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.StunStartU,             File.SNAKE_DOWNSTANDU,            -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Stun,                   File.SNAKE_STUN,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Sleep,                  File.SNAKE_STUN,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Grab,                   File.SNAKE_GRAB,                  -1,                       0x10000000)
    Character.edit_action_parameters(SNAKE, Action.GrabPull,               File.SNAKE_GRABPULL,              IDLE,                       0x10000000)
    Character.edit_action_parameters(SNAKE, Action.ThrowF,                 File.SNAKE_THROWF,                THROWF,                   -1)
    Character.edit_action_parameters(SNAKE, Action.ThrowB,                 File.SNAKE_THROWB,                THROWB,                   -1)
    Character.edit_action_parameters(SNAKE, Action.CapturePulled,          File.SNAKE_CAPTUREPULLED,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.EggLayPulled,           File.SNAKE_CAPTUREPULLED,         -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.EggLay,                 File.SNAKE_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Taunt,                  File.SNAKE_TAUNT,                 -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.Jab1,                   File.SNAKE_JAB1,                  JAB1,                     -1)
    Character.edit_action_parameters(SNAKE, Action.Jab2,                   File.SNAKE_JAB2,                  JAB2,                     -1)
    Character.edit_action_parameters(SNAKE, 0xDC,                          File.SNAKE_ACTION_0DC,            JAB3,                     -1)
    Character.edit_action_parameters(SNAKE, Action.DashAttack,             File.SNAKE_DASHATTACK,            DASH,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FTiltHigh,              File.SNAKE_FTILT,                 FTILT,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FTiltMidHigh,           0,                              0x80000000,               0)
    Character.edit_action_parameters(SNAKE, Action.FTilt,                  File.SNAKE_FTILT,                 FTILT,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FTiltMidLow,            0,                              0x80000000,               0)
    Character.edit_action_parameters(SNAKE, Action.FTiltLow,               File.SNAKE_FTILT,                 FTILT,                       -1)
    Character.edit_action_parameters(SNAKE, Action.UTilt,                  File.SNAKE_UTILT,                 UTILT,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DTilt,                  File.SNAKE_DTILT,                 DTILT,                       -1)
    Character.edit_action_parameters(SNAKE, Action.FSmashHigh,             File.SNAKE_FSMASH,                SMASHF,                       0x10000000)
    Character.edit_action_parameters(SNAKE, Action.FSmash,                 File.SNAKE_FSMASH,                SMASHF,                       0x10000000)
    Character.edit_action_parameters(SNAKE, Action.FSmashLow,              File.SNAKE_FSMASH,                SMASHF,                       0x10000000)
    Character.edit_action_parameters(SNAKE, Action.USmash,                 File.SNAKE_USMASH,                -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.DSmash,                 File.SNAKE_DSMASH,                -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.AttackAirN,             File.SNAKE_ATTACKAIRN,            AIRN,                       -1)
    Character.edit_action_parameters(SNAKE, Action.AttackAirF,             File.SNAKE_ATTACKAIRF,            AIRF,                       -1)
    Character.edit_action_parameters(SNAKE, Action.AttackAirB,             File.SNAKE_ATTACKAIRB,            AIRB,                       -1)
    Character.edit_action_parameters(SNAKE, Action.AttackAirU,             File.SNAKE_ATTACKAIRU,            AIRU,                       -1)
    Character.edit_action_parameters(SNAKE, Action.AttackAirD,             File.SNAKE_ATTACKAIRD,            AIRD,                       -1)
    Character.edit_action_parameters(SNAKE, Action.LandingAirF,            File.SNAKE_LANDINGAIRF,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.LandingAirB,            File.SNAKE_LANDINGAIRB,           -1,                       -1)
    Character.edit_action_parameters(SNAKE, Action.LandingAirX,            File.SNAKE_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SNAKE, 0xE4,                          -1,                               JAB1,                     -1)
    Character.edit_action_parameters(SNAKE, 0xE5,                          -1,                               JAB1,                     -1)
    Character.edit_action_parameters(SNAKE, 0xEB,                          File.SNAKE_ACTION_0EB,            SPU,                     -1)
    Character.edit_action_parameters(SNAKE, 0xEE,                          File.SNAKE_ACTION_0EB,            SPU,                     -1)
    Character.edit_action_parameters(SNAKE, 0xEC,                          File.SNAKE_ACTION_0EC,             -1,                      -1)

    // Modify Actions            // Action          // Staling ID   // Main ASM                 // Interrupt/Other ASM          // Movement/Physics ASM         // Collision ASM
    Character.edit_action(SNAKE, 0xEB,              -1,             SnakeUSP.main_,         SnakeUSP.interrupt_,            -1,          -1)
    Character.edit_action(SNAKE, 0xEE,              -1,             SnakeUSP.main_,         SnakeUSP.interrupt_,            -1,          -1)
   // Character.edit_action(SNAKE, 0xEC,              -1,             SnakeUSP.fall_,         -1,            -1,          -1)

    // Modify Menu Action Parameters             // Action          // Animation                // Moveset Data             // Flags
    Character.edit_menu_action_parameters(SNAKE,   0x0,               File.SNAKE_BOX,               BOX,                        -1)          // CSS Idle
    Character.edit_menu_action_parameters(SNAKE,   0x1,               File.SNAKE_VICTORY_1,         -1,                         -1)          // Victory1
    Character.edit_menu_action_parameters(SNAKE,   0x2,               File.SNAKE_VICTORY_2,         -1,                         -1)          // Victory2
    Character.edit_menu_action_parameters(SNAKE,   0x3,               File.SNAKE_VICTORY_3,         BOX,                        -1)          // Victory3
    Character.edit_menu_action_parameters(SNAKE,   0x4,               File.SNAKE_VICTORY_3,         CSS,                        -1)          // CSS Select
    Character.edit_menu_action_parameters(SNAKE,   0xD,               File.SNAKE_1P_POSE,           BOX,                        -1)          // Classic Mode Pose
    Character.edit_menu_action_parameters(SNAKE,   0x5,               File.SNAKE_CLAP,              -1,                         -1)
    Character.edit_menu_action_parameters(SNAKE,   0x9,               File.SNAKE_CONTINUEFALL,      -1,                         -1)
    Character.edit_menu_action_parameters(SNAKE,   0xA,               File.SNAKE_CONTINUEUP,        -1,                         -1)

    // Set default costumes
    // Character.set_default_costumes(Character.id.SNAKE, 0, 1, 2, 3, 4)

    // Shield colors for costume matching
    Character.set_costume_shield_colors(SNAKE, PURPLE, RED, GREEN, WHITE, BLACK, BLUE, NA, NA)

        // Remove entry script (no Blue Falcon).
    Character.table_patch_start(entry_script, Character.id.SNAKE, 0x4)
    dw 0x8013DD68                           // skips entry script
    OS.patch_end()

    // @ Description
    // When an opponent is grabbed by SNAKE, they will be put into the ThrownDK action (0xB8)
    // rather than the usual CapturePulled action (0xAB)
    // Also used by Mad Piano.
    scope capture_action_fix_: {
        OS.patch_start(0xC534C, 0x8014A90C)
        j       capture_action_fix_
        nop
        _return:
        OS.patch_end()

        // v0 = grabbing player struct
        ori     a1, r0, Character.id.SNAKE  // a1 = id.SNAKE
        lw      a2, 0x0008(v0)              // a2 = grabbing player character id
        beq     a1, a2, _snake              // if id = SNAKE, load alternate action
        ori     a1, r0, Character.id.WARIO  // a1 = id.WARIO
        lw      a2, 0x0008(v0)              // a2 = grabbing player character id
        beq     a1, a2, _snake              // if id = WARIO, load alternate action
        ori     a1, r0, Action.CapturePulled// original line 1
        ori     a1, r0, Character.id.PIANO  // a1 = id.PIANO
        bne     a1, a2, _end                // if id != PIANO, skip
        ori     a1, r0, Action.CapturePulled// original line 1

        _snake:
        // if id = SNAKE or PIANO
        ori     a1, r0, Action.ThrownDK     // captured player action = ThrownDK

        _end:
        addiu   a2, r0, 0x0000              // original line 2
        j       _return                     // return
        nop
    }

    // @ Description
    // Attempts to fix the position of the grabbed character on frame 1 of SNAKE's GrabPull action.
    // Not perfect, but a big improvement.
    // Also used by Mad Piano.
    scope capture_position_fix_: {
        OS.patch_start(0xC539C, 0x8014A95C)
        j       capture_position_fix_
        nop
        _return:
        OS.patch_end()

        lw      a0, 0x0044(sp)              // ~
        lw      a0, 0x0084(a0)              // v0 = grabbing player struct
        lw      a0, 0x0008(a0)              // a0 = grabbing player character id
        ori     a1, r0, Character.id.PIANO  // a1 = id.PIANO
        beq     a0, a1, _snake              // branch if id = PIANO
        ori     a1, r0, Character.id.SNAKE  // a1 = id.SNAKE
        beq     a0, a1, _snake              // branch if id = SNAKE
        ori     a1, r0, Character.id.WARIO  // a1 = id.WARIO
        beq     a0, a1, _snake              // branch if id = WARIO
        nop
        // if id != SNAKE
        jal     0x8014A6B4                  // original line 1
        or      a0, s1, r0                  // original line 2
        j       _return                     // return
        nop

        _snake:
        // Usually, 8014A6B4 is used to set the captured player's position on the first frame of
        // being grabbed, with 8014AB64 being used on subsequent frames.
        // If the grabbing character is SNAKE or Piano, 8014AB64 will be used on the first frame instead.
        jal     0x8014AB64                  // modified original line 1
        or      a0, s1, r0                  // original line 2
        j       _return                     // return
        nop
    }

    // @ Description
    // Modifies the subroutine which handles mashing/breaking out of the ThrownDK action.
    // Skips if the throwing character is SNAKE.
    // Also used by Mad Piano, and makes Mad Piano's captured opponent invisible.
    scope capture_break_fix_: {
        OS.patch_start(0xC8F14, 0x8014E4D4)
        j       capture_break_fix_
        nop
        _return:
        OS.patch_end()

        lw      a2, 0x0084(a0)              // a2 = captured player struct
        lw      a2, 0x0844(a2)              // a2 = player.entity_captured_by
        lw      a2, 0x0084(a2)              // a2 = grabbing player struct
        lw      t7, 0x0008(a2)              // a2 = grabbing player character id
        ori     a3, r0, Character.id.PIANO  // a3 = id.PIANO
        beq     t7, a3, _piano              // branch if id = PIANO
        ori     a3, r0, Character.id.MARINA // a3 = id.MARINA
        beq     t7, a3, _marina             // branch if id = MARINA
        ori     a3, r0, Character.id.SNAKE  // a3 = id.SNAKE
        beq     t7, a3, _end                // branch if id = SNAKE
        ori     a3, r0, Character.id.WARIO  // a3 = id.WARIO
        beq     t7, a3, _end                // branch if id = WARIO
        nop
        // if id != SNAKE
        addiu   sp, sp, 0xFFD8              // original line 1
        sw      ra, 0x0014(sp)              // original line 2
        j       _return                     // return (and continue subroutine)
        nop

        _marina:
        lli     a3, Action.ThrowF           // a3 = ThrowF
        lw      t7, 0x0024(a2)              // t7 = grabbing player action
        beq     a3, t7, _end                // end if action = ThrowF
        nop
        addiu   sp, sp, 0xFFD8              // original line 1
        j       _return                     // return (and continue subroutine)
        sw      ra, 0x0014(sp)              // original line 2


        _piano:
        lli     a3, Action.GrabWait         // a3 = GrabWait
        lw      t7, 0x0024(a2)              // t7 = grabbing player action
        bne     a3, t7, _end                // skip if action != GrabWait
        lw      a2, 0x0084(a0)              // a2 = captured player struct
        // if we're here, then the captured player is being held by Mad Piano's grab, so make them invisible.
        lbu     t7, 0x018D(a2)              // t7 = bit field
        ori     t7, t7, 0x0001              // enable bitflag for invisibility
        sb      t7, 0x018D(a2)              // update bit field

        _end:
        jr      ra                          // end subroutine
        nop
    }

    // Set crowd chant FGM.
     Character.table_patch_start(crowd_chant_fgm, Character.id.SNAKE, 0x2)
     dh  0x031E
     OS.patch_end()

    // Set action strings
    Character.table_patch_start(action_string, Character.id.SNAKE, 0x4)
    dw  Action.CAPTAIN.action_string_table
    OS.patch_end()

    Character.table_patch_start(rapid_jab, Character.id.SNAKE, 0x4)
    dw      Character.rapid_jab.DISABLED        // disable rapid jab
    OS.patch_end()

        scope Action {
        constant Grenade(0x0E4)
        constant GrenadeAir(0x0E5)

        // strings!
        string_0x0E4:; String.insert("Grenade")
        string_0x0E5:; String.insert("GrenadeAir")

        action_string_table:
        dw string_0x0E4
        dw string_0x0E5
    }
}
