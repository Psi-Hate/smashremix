scope dark_samus_costumes {
    // @ Description
    // Number of additional costumes
    constant NUM_EXTRA_COSTUMES(1)

    // @ Description
    // Number of parts
    constant NUM_PARTS(0x20)

    // @ Description
    // Number of original costumes
    constant NUM_COSTUMES(6)

    stock_icon_palette_array:
    fill NUM_COSTUMES * 4
    constant EXTRA_STOCK_ICON_PALETTE_ARRAY_ORIGIN(origin())
    fill NUM_EXTRA_COSTUMES * 4

    // @ Description
    // Points to array of extra costumes' stock icon palettes
    // NOTE: must be right before parts_table
    stock_icon_palette_array_pointer:
    dw stock_icon_palette_array

    parts_table:
    constant PARTS_TABLE_ORIGIN(origin())
    db NUM_EXTRA_COSTUMES       // 0x0 - number of extra costumes
    db 0x0                      // 0x1 - special part ID
    db 0x0                      // 0x2 - special part image index start
    db 0x0                      // 0x3 - costumes to skip
    fill 4 + (NUM_PARTS - 1) * 8

    Costumes.define_part(1, 2, Costumes.part_type.PALETTE)                         // part 0x1_0 - pelvis - rear
    Costumes.add_part_image(1, 1, Costumes.part_type.PALETTE)                      // part 0x1_1 - pelvis - front
    Costumes.define_part(2, 3, Costumes.part_type.PALETTE)                         // part 0x2_0 - torso - upper back
    Costumes.add_part_image(2, 1, Costumes.part_type.PALETTE)                      // part 0x2_1 - torso - bottom
    Costumes.add_part_image(2, 2, Costumes.part_type.PALETTE)                      // part 0x2_2 - torso - upper front
    Costumes.define_special_parts_for_part(2, 3)                                   // part 0x2_0_0 - morphball none? not used
    Costumes.add_special_part(2, 1, 1, Costumes.part_type.PALETTE)                 // part 0x2_1_0 - morphball large
    Costumes.add_special_part(2, 2, 1, Costumes.part_type.PALETTE)                 // part 0x2_2_0 - morphball small
    Costumes.define_part(4, 2, Costumes.part_type.PALETTE)                         // part 0x4_0 - left upper arm - bicep
    Costumes.add_part_image(4, 1, Costumes.part_type.PALETTE)                      // part 0x4_1 - left upper arm - shoulder
    Costumes.define_part(5, 1, Costumes.part_type.PALETTE)                         // part 0x5_0 - left lower arm
    Costumes.define_part(6, 2, Costumes.part_type.PALETTE)                         // part 0x6_0 - left hand
    Costumes.add_part_image(6, 1, Costumes.part_type.PALETTE)                      // part 0x6_1 - left_hand - back (when clapping) [special part]
    Costumes.define_part(9, 3, Costumes.part_type.PALETTE)                         // part 0x9_0 - head - helmet side
    Costumes.add_part_image(9, 1, Costumes.part_type.PALETTE)                      // part 0x9_1 - head - helmet top
    Costumes.add_part_image(9, 2, Costumes.part_type.PALETTE)                      // part 0x9_2 - head - helmet front
    Costumes.define_part(B, 2, Costumes.part_type.PALETTE)                         // part 0xB_0 - right upper arm - bicep
    Costumes.add_part_image(B, 1, Costumes.part_type.PALETTE)                      // part 0xB_1 - right upper arm - shoulder
    Costumes.define_part(C, 1, Costumes.part_type.PALETTE)                         // part 0xC_0 - right lower arm
    Costumes.define_part(D, 2, Costumes.part_type.TEXTURE_ARRAY)                   // part 0xD_0 - grapple 1 - background [special part]
    Costumes.add_part_image(D, 1, Costumes.part_type.TEXTURE_ARRAY)                // part 0xD_1 - grapple 1 - foreground [special part]
    Costumes.define_part(E, 2, Costumes.part_type.TEXTURE_ARRAY)                   // part 0xE_0 - grapple 2 [special part]
    Costumes.add_part_image(E, 1, Costumes.part_type.TEXTURE_ARRAY)                // part 0xE_1 - grapple 2 [special part]
    Costumes.define_part(F, 2, Costumes.part_type.TEXTURE_ARRAY)                   // part 0xF_0 - grapple 3 [special part]
    Costumes.add_part_image(F, 1, Costumes.part_type.TEXTURE_ARRAY)                // part 0xF_1 - grapple 3 [special part]
    Costumes.define_part(10, 2, Costumes.part_type.TEXTURE_ARRAY)                  // part 0x10_0 - grapple 4 [special part]
    Costumes.add_part_image(10, 1, Costumes.part_type.TEXTURE_ARRAY)               // part 0x10_1 - grapple 4 [special part]
    Costumes.define_part(11, 2, Costumes.part_type.TEXTURE_ARRAY)                  // part 0x11_0 - grapple 5 [special part]
    Costumes.add_part_image(11, 1, Costumes.part_type.TEXTURE_ARRAY)               // part 0x11_1 - grapple 5 [special part]
    Costumes.define_part(12, 2, Costumes.part_type.TEXTURE_ARRAY)                  // part 0x12_0 - grapple 6 [special part]
    Costumes.add_part_image(12, 1, Costumes.part_type.TEXTURE_ARRAY)               // part 0x12_1 - grapple 6 [special part]
    Costumes.define_part(17, 2, Costumes.part_type.PALETTE)                        // part 0x17_0 - left upper leg - inner thigh
    Costumes.add_part_image(17, 1, Costumes.part_type.PALETTE)                     // part 0x17_1 - left upper leg - outer thigh
    Costumes.define_part(18, 1, Costumes.part_type.PALETTE)                        // part 0x18_0 - left lower leg
    Costumes.define_part(1A, 2, Costumes.part_type.PALETTE)                        // part 0x1A_0 - left foot - inner/toes
    Costumes.add_part_image(1A, 1, Costumes.part_type.PALETTE)                     // part 0x1A_1 - left foot - outer
    Costumes.define_part(1C, 2, Costumes.part_type.PALETTE)                        // part 0x1C_0 - right upper leg - outer thigh
    Costumes.add_part_image(1C, 1, Costumes.part_type.PALETTE)                     // part 0x1C_1 - right upper leg - inner thigh
    Costumes.define_part(1D, 1, Costumes.part_type.PALETTE)                        // part 0x1D_0 - right lower leg
    Costumes.define_part(1F, 2, Costumes.part_type.PALETTE)                        // part 0x1F_0 - right foot - inner/toecs
    Costumes.add_part_image(1F, 1, Costumes.part_type.PALETTE)                     // part 0x1F_1 - right foot - outer

    // Register extra costumes
    Costumes.register_extra_costumes_for_char(Character.id.DSAMUS)

    // Costume 0x6
    // Yellow Team
    scope costume_0x6 {
        palette_1:; insert "DarkSamus/cos_6_1.bin"      // pelvis rear
        palette_2:; insert "DarkSamus/cos_6_2.bin"      // pelvis front, foot
        palette_3:; insert "DarkSamus/cos_6_3.bin"      // upper torso back
        palette_4:; insert "DarkSamus/cos_6_4.bin"      // lower torso
        palette_5:; insert "DarkSamus/cos_6_5.bin"      // upper torso front
        palette_6:; insert "DarkSamus/cos_6_6.bin"      // spiky shoulder
        palette_7:; insert "DarkSamus/cos_6_7.bin"      // upper arm
        palette_8:; insert "DarkSamus/cos_6_8.bin"      // left lower arm
        palette_9:; insert "DarkSamus/cos_6_9.bin"      // left hand back
        palette_A:; insert "DarkSamus/cos_6_A.bin"      // helmet side
        palette_B:; insert "DarkSamus/cos_6_B.bin"      // helmet top
        palette_C:; insert "DarkSamus/cos_6_C.bin"      // helmet front
        palette_D:; insert "DarkSamus/cos_6_D.bin"      // arm cannon
        // palette_E:; insert "DarkSamus/cos_6_E.bin"  // closed hand texture
        palette_F:; insert "DarkSamus/cos_6_F.bin"      // lower leg/back hand
        palette_10:; insert "DarkSamus/cos_6_10.bin"    // morphball (weird nugget in-between model?)
        palette_11:; insert "DarkSamus/cos_6_11.bin"    // morphball

        Costumes.set_palette_for_part(0, 1, 0, palette_1)
        Costumes.set_palette_for_part(0, 1, 1, palette_2)
        Costumes.set_palette_for_part(0, 2, 0, palette_3)
        Costumes.set_palette_for_part(0, 2, 1, palette_4)
        Costumes.set_palette_for_part(0, 2, 2, palette_5)
        Costumes.set_palette_for_special_part(0, 2, 1, 0, palette_10)
        Costumes.set_palette_for_special_part(0, 2, 2, 0, palette_11)
        Costumes.set_palette_for_part(0, 4, 0, palette_6)
        Costumes.set_palette_for_part(0, 4, 1, palette_7)
        Costumes.set_palette_for_part(0, 5, 0, palette_8)
        Costumes.set_palette_for_part(0, 6, 0, palette_8)
        Costumes.set_palette_for_part(0, 6, 1, palette_9)
        Costumes.set_palette_for_part(0, 9, 0, palette_A)
        Costumes.set_palette_for_part(0, 9, 1, palette_B)
        Costumes.set_palette_for_part(0, 9, 2, palette_C)
        Costumes.set_palette_for_part(0, B, 0, palette_6)
        Costumes.set_palette_for_part(0, B, 1, palette_7)
        Costumes.set_palette_for_part(0, C, 0, palette_D)
        Costumes.set_palette_for_part(0, 17, 0, palette_4)
        Costumes.set_palette_for_part(0, 17, 1, palette_9)
        Costumes.set_palette_for_part(0, 18, 0, palette_F)
        Costumes.set_palette_for_part(0, 1A, 0, palette_2)
        Costumes.set_palette_for_part(0, 1A, 1, palette_1)
        Costumes.set_palette_for_part(0, 1C, 0, palette_9)
        Costumes.set_palette_for_part(0, 1C, 1, palette_4)
        Costumes.set_palette_for_part(0, 1D, 0, palette_F)
        Costumes.set_palette_for_part(0, 1F, 0, palette_2)
        Costumes.set_palette_for_part(0, 1F, 1, palette_1)

        Costumes.set_stock_icon_palette_for_costume(0, DarkSamus/cos_6_stock_icon.bin)
    }

}
