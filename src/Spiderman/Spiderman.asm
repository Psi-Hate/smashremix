// Spiderman.asm

// This file contains file inclusions, action edits, and assembly for Spider-Man.

scope SPM {
    // Insert Moveset files
    insert VICTORY_1, "moveset/VICTORY_1.bin"
    insert VICTORY_3, "moveset/VICTORY_3.bin"
    
    // Modify Action Parameters             // Action               // Animation                // Moveset Data             // Flags

    // Modify Menu Action Parameters             // Action          // Animation                // Moveset Data             // Flags
    Character.edit_menu_action_parameters(SPM,   0x0,               File.SPM_IDLE,              -1,                         -1)          // CSS Idle
    Character.edit_menu_action_parameters(SPM,   0x1,               File.SPM_VICTORY_1,         VICTORY_1,                  -1)          // Victory1
    Character.edit_menu_action_parameters(SPM,   0x2,               File.SPM_VICTORY_2,         -1,                         -1)          // Victory2
    Character.edit_menu_action_parameters(SPM,   0x3,               File.SPM_VICTORY_3,         VICTORY_3,                  -1)          // Victory3
    Character.edit_menu_action_parameters(SPM,   0x4,               File.SPM_VICTORY_1,         VICTORY_1,                  -1)          // CSS Select
    Character.edit_menu_action_parameters(SPM,   0xD,               File.SPM_1P_POSE,           -1,                         -1)          // Classic Mode Pose

    // Remove entry script.
    Character.table_patch_start(entry_script, Character.id.SPM, 0x4)
    dw 0x8013DD68                           // skips entry script
    OS.patch_end()

    // Set crowd chant FGM.
     Character.table_patch_start(crowd_chant_fgm, Character.id.SPM, 0x2)
     dh  0x031E
     OS.patch_end()

    // Set action strings
    Character.table_patch_start(action_string, Character.id.SPM, 0x4)
    dw  Action.CAPTAIN.action_string_table
    OS.patch_end()

    // Set default costumes
    Character.set_default_costumes(Character.id.SPM, 0, 1, 2, 3, 1, 2, 3)

    // Shield colors for costume matching
    haracter.set_costume_shield_colors(SPM, BLUE, RED, GREEN, BLACK, BLUE, BLUE, YELLOW, WHITE)

}
