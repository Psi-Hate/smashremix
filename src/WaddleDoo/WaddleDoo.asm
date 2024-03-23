// WaddleDoo.asm

// This file contains file inclusions, action edits, and assembly for Waddle Doo.

scope WaddleDoo {

    // Image commands used by moveset files
	scope EYES: {
		constant OPEN(0xAC000000)
		constant SHOCK(0xAC000006)
		constant CLOSED(0xAC000005)	// blink
		constant HALF(0xAC000004)
        constant DIZZY(0xAC000003)
	}

    // Insert Moveset files
    insert SPARKLE,"moveset/SPARKLE.bin"; Moveset.GO_TO(SPARKLE)            // loops
    insert SHIELD_BREAK,"moveset/SHIELD_BREAK.bin"; Moveset.GO_TO(SPARKLE)            // loops
    insert DAIR, "moveset/DAIR.bin"
    insert DASHATTACK, "moveset/DASHATTACK.bin"
    insert BLINK_SUBROUTINE, "moveset/BLINK_SUBROUTINE.bin"
    insert NEUTRAL_SPECIAL, "moveset/NEUTRAL_SPECIAL.bin"
    insert UP_SPECIAL, "moveset/UP_SPECIAL.bin"
    insert DSPECIAL, "moveset/DSPECIAL.bin"; Moveset.SUBROUTINE(BLINK_SUBROUTINE)
    dw 0x04000014; Moveset.SUBROUTINE(BLINK_SUBROUTINE)
    dw 0x00000000
    insert TECH_STAND, "moveset/TECH_STAND.bin"
    insert TECH_ROLL, "moveset/TECH_ROLL.bin"
    insert STUN, "moveset/STUN_LOOP.bin"; Moveset.GO_TO(STUN)
    insert TAUNT, "moveset/TAUNT.bin"
    dw 0x04000014; Moveset.SUBROUTINE(BLINK_SUBROUTINE)
    dw 0x04000014; Moveset.SUBROUTINE(BLINK_SUBROUTINE)
    dw 0x0800003C
    dw 0x58000001
    dw 0x00000000
    insert SLEEP, "moveset/SLEEP.bin"; Moveset.GO_TO(SLEEP)                      // loops
    insert ENTRY, "moveset/ENTRY.bin"
    insert DTILT, "moveset/DTILT.bin"
    insert IDLE, "moveset/IDLE.bin"

    insert STARRING,"moveset/STARRING.bin"

    // Action name constants.
    scope Action {
        constant JUMP_2(0xDF)
        constant JUMP_3(0xE0)
        constant JUMP_4(0xE1)
        constant JUMP_5(0xE2)

        //constant WADDLEDOO_STARRING_LEFT(0x103)
        //constant WADDLEDOO_STARRING_RIGHT(0x104)

        string_0x0DF:; String.insert("Jump2")
        string_0x0E0:; String.insert("Jump3")
        string_0x0E1:; String.insert("Jump4")
        string_0x0E2:; String.insert("Jump5")
        string_0x103:; String.insert("AppearLeft")
        string_0x104:; String.insert("AppearRight")

        action_string_table:
        dw string_0x0DF
        dw string_0x0E0
        dw string_0x0E1
        dw string_0x0E2
        dw string_0x103
        dw string_0x104
    }

    // Modify Action Parameters             // Action               // Animation                // Moveset Data             // Flags

    Character.edit_action_parameters(WADDLEDOO, Action.Idle,            File.WADDLE_DOO_IDLE,       IDLE,                         -1)
    Character.edit_action_parameters(WADDLEDOO, Action.AttackAirD,      -1,                         DAIR,                         -1)
    Character.edit_action_parameters(WADDLEDOO, Action.ShieldBreak,     -1,                         SHIELD_BREAK,                 -1)
    Character.edit_action_parameters(WADDLEDOO, Action.Stun,            -1,                         STUN,                         -1)
    Character.edit_action_parameters(WADDLEDOO, Action.Sleep,           -1,                         SLEEP,                        -1)
    Character.edit_action_parameters(WADDLEDOO, Action.Tech,            -1,                         TECH_STAND,                   -1)
    Character.edit_action_parameters(WADDLEDOO, Action.TechF,           -1,                         TECH_ROLL,                    -1)
    Character.edit_action_parameters(WADDLEDOO, Action.TechB,           -1,                         TECH_ROLL,                    -1)
    Character.edit_action_parameters(WADDLEDOO, Action.Taunt,           -1,                         TAUNT,                        -1)
    Character.edit_action_parameters(WADDLEDOO, Action.DashAttack,      -1,                         DASHATTACK,                   -1)
    Character.edit_action_parameters(WADDLEDOO, Action.JumpAerialF,     File.WADDLE_DOO_JUMP2,      -1,                           -1)
    Character.edit_action_parameters(WADDLEDOO, Action.JumpAerialB,     File.WADDLE_DOO_JUMP2,      -1,                            0)
    Character.edit_action_parameters(WADDLEDOO, Action.KIRBY.Jump2,     File.WADDLE_DOO_JUMP2,      -1,                            0)
    Character.edit_action_parameters(WADDLEDOO, Action.KIRBY.Jump3,     File.WADDLE_DOO_JUMP2,      -1,                            0)
    Character.edit_action_parameters(WADDLEDOO, Action.KIRBY.Jump4,     File.WADDLE_DOO_JUMP2,      -1,                            0)
    Character.edit_action_parameters(WADDLEDOO, Action.KIRBY.Jump5,     File.WADDLE_DOO_JUMP3,      -1,                            0)
    Character.edit_action_parameters(WADDLEDOO, Action.FallAerial,      File.WADDLE_DOO_FALL2,      -1,                           -1)
    //Character.edit_action_parameters(WADDLEDOO, 0xE4,                 File.WADDLE_DOO_APPEAR_LEFT,    -1,                       -1)
    //Character.edit_action_parameters(WADDLEDOO, 0xE5,                 File.WADDLE_DOO_APPEAR_RIGHT,   -1,                       -1)
    Character.edit_action_parameters(WADDLEDOO, 0xE6,                   -1,                         NEUTRAL_SPECIAL,              -1)
    Character.edit_action_parameters(WADDLEDOO, 0xE7,                   -1,                         NEUTRAL_SPECIAL,              -1)
    Character.edit_action_parameters(WADDLEDOO, 0xE8,                   -1,                         TAUNT,                        -1)
    Character.edit_action_parameters(WADDLEDOO, 0xE9,                   -1,                         TAUNT,                        -1)
    Character.edit_action_parameters(WADDLEDOO, 0xEA,                   -1,                         DSPECIAL,                     -1)
    Character.edit_action_parameters(WADDLEDOO, 0xEB,                   -1,                         DSPECIAL,                     -1)
    Character.edit_action_parameters(WADDLEDOO, Action.DTilt,           File.WADDLE_DOO_DTILT,      DTILT,                0x40000000)
    Character.edit_action_parameters(WADDLEDOO, Action.DamageElec1,     File.WADDLE_DOO_SHOCK,      -1,                           -1)
    Character.edit_action_parameters(WADDLEDOO, Action.DamageElec2,     File.WADDLE_DOO_SHOCK,      -1,                           -1)
    Character.edit_action_parameters(WADDLEDOO, Action.RollF,           File.WADDLE_DOO_ROLLF,      -1,                           -1)
    Character.edit_action_parameters(WADDLEDOO, Action.RollB,           File.WADDLE_DOO_ROLLB,      -1,                           -1)

    // Modify Actions            // Action                   // Staling ID    // Main ASM                     // Interrupt/Other ASM          // Movement/Physics ASM         // Collision ASM
    Character.edit_action(WADDLEDOO, Action.JUMP_2,              -1,              0x8013FB00,                   0x8013FB2C,                      0x8013FC4C,                     0x800DE978)
    Character.edit_action(WADDLEDOO, Action.JUMP_3,              -1,              0x8013FB00,                   0x8013FB2C,                      0x8013FC4C,                     0x800DE978)
    Character.edit_action(WADDLEDOO, Action.JUMP_4,              -1,              0x8013FB00,                   0x8013FB2C,                      0x8013FC4C,                     0x800DE978)
    Character.edit_action(WADDLEDOO, Action.JUMP_5,              -1,              0x8013FB00,                   0x8013FB2C,                      0x8013FC4C,                     0x800DE978)

//    // Modify Menu Action Parameters             // Action      // Animation                  // Moveset Data             // Flags

    Character.edit_menu_action_parameters(WADDLEDOO, 0x0,           File.WADDLE_DOO_IDLE,          IDLE,                         -1)
    //Character.edit_menu_action_parameters(WADDLEDOO, 0x1,           File.DEDEDE_VICTORY_1,         0x80000000,                 -1)
    //Character.edit_menu_action_parameters(WADDLEDOO, 0x2,           File.DEDEDE_VICTORY_3,         VICTORY_3,                  -1)
    //Character.edit_menu_action_parameters(WADDLEDOO, 0x3,           File.DEDEDE_VICTORY_2,         VICTORY_2,                  -1)
    //Character.edit_menu_action_parameters(WADDLEDOO, 0x4,           File.DEDEDE_VICTORY_1,         0x80000000,                 -1)
    //Character.edit_menu_action_parameters(WADDLEDOO, 0x5,           File.DEDEDE_CLAP,              CLAP,                       -1)
    Character.edit_menu_action_parameters(WADDLEDOO, 0xD,           File.DEDEDE_1P_POSE,           0x80000000,                 -1)
    Character.edit_menu_action_parameters(WADDLEDOO, 0xE,           File.DEDEDE_CPU_POSE,          0x80000000,                 -1)
    //Character.edit_menu_action_parameters(WADDLEDOO, 0x9,           File.DEDEDE_PUPPET_FALL,       -1,                         -1)
    //Character.edit_menu_action_parameters(WADDLEDOO, 0xA,           File.DEDEDE_PUPPET_UP,         -1,                         -1)


//    // Add Action Parameters                // Action Name             // Base Action  // Animation                 // Moveset Data            // Flags
     Character.add_new_action_params(WADDLEDOO, WADDLEDOO_STARRING_RIGHT,       -1,             File.WADDLE_DOO_APPEAR_RIGHT,    ENTRY,                  0x40000008)
     Character.add_new_action_params(WADDLEDOO, WADDLEDOO_STARRING_LEFT,        -1,             File.WADDLE_DOO_APPEAR_LEFT,     ENTRY,                  0x40000008)

    // Add Actions                    // Action Name             // Base Action //Parameters                                // Staling ID    // Main ASM            // Interrupt/Other ASM                  // Movement/Physics ASM     // Collision ASM
     Character.add_new_action(WADDLEDOO, WADDLEDOO_STARRING_RIGHT,      -1,           ActionParams.WADDLEDOO_STARRING_RIGHT,          0x0,             0x8013DA94,            0x00000000,                             0x8013DB2C,                 0x800DE348)
     Character.add_new_action(WADDLEDOO, WADDLEDOO_STARRING_LEFT,       -1,           ActionParams.WADDLEDOO_STARRING_LEFT,           0x0,             0x8013DA94,            0x00000000,                             0x8013DB2C,                 0x800DE348)

    // Set crowd chant FGM.
    Character.table_patch_start(crowd_chant_fgm, Character.id.WADDLEDOO, 0x2)
    dh  0x0579
    OS.patch_end()

    // Set action strings
    Character.table_patch_start(action_string, Character.id.WADDLEDOO, 0x4)
    dw  Action.action_string_table
    OS.patch_end()

    Character.table_patch_start(variant_original, Character.id.WADDLEDOO, 0x4)
    dw      Character.id.DEDEDE // set Dedede as original character (not Jigglypuff, who WADDLEDOO is a clone of)
    OS.patch_end()

    // Use Kirby Entry
    Character.table_patch_start(entry_action, Character.id.WADDLEDOO, 0x8)
    dw WaddleDoo.Action.WADDLEDOO_STARRING_RIGHT, WaddleDoo.Action.WADDLEDOO_STARRING_LEFT
    OS.patch_end()
    Character.table_patch_start(entry_script, Character.id.WADDLEDOO, 0x4)
    dw 0x8013DCF4                           // kirby entry
    OS.patch_end()

    // Set default costumes
    Character.set_default_costumes(Character.id.WADDLEDOO, 0, 1, 3, 5, 3, 2, 4)
    Teams.add_team_costume(YELLOW, WADDLEDOO, 0x1)

    // Shield colors for costume matching
    Character.set_costume_shield_colors(WADDLEDOO, ORANGE, YELLOW, BLUE, PINK, GREEN, MAGENTA, BLACK, NA)

    constant jump_decay(0x42A0)				// same as Kirbys

	jump_multiplier_table:
	dw		0.0		// na
	dw		0.0		// na
	float32 68		// jump 3
	float32 58		// jump 4
	float32 52		// jump 5
	float32 0		// jump 6 (unused)
}
