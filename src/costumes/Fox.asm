scope fox_costumes {
    // @ Description
    // Number of additional costumes
    constant NUM_EXTRA_COSTUMES(4)

    // @ Description
    // Number of parts
    constant NUM_PARTS(0x18)

    // @ Description
    // Number of original costumes
    constant NUM_COSTUMES(4)

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
    // part 0x0 never has images, so we can store extra info here
    db NUM_EXTRA_COSTUMES       // 0x0 - number of extra costumes
    db 0x0                      // 0x1 - special part ID
    db 0x0                      // 0x2 - special part image index start
    db 0x0                      // 0x3 - costumes to skip
    fill 4 + (NUM_PARTS - 1) * 8

    Costumes.define_part(1, 2, Costumes.part_type.PALETTE)                                    // part 0x1_0 - pelvis - front
    Costumes.add_part_image(1, 1, Costumes.part_type.PRIM_COLOR)                              // part 0x1_1 - pelvis - back
    Costumes.define_part(2, 4, Costumes.part_type.PALETTE | Costumes.part_type.PRIM_COLOR)    // part 0x2_0 - torso - front (hi poly) / back/sides (lo poly)
    Costumes.add_part_image(2, 1, Costumes.part_type.PALETTE | Costumes.part_type.PRIM_COLOR) // part 0x2_1 - torso - back/sides (hi poly) / front (lo poly)
    Costumes.add_part_image(2, 2, Costumes.part_type.PRIM_COLOR)                              // part 0x2_2 - torso - left collar
    Costumes.add_part_image(2, 3, Costumes.part_type.PRIM_COLOR)                              // part 0x2_3 - torso - right collar
    Costumes.define_part(4, 1, Costumes.part_type.PRIM_COLOR)                                 // part 0x4_0 - left upper arm
    Costumes.define_part(8, 2, Costumes.part_type.TEXTURE_ARRAY)                              // part 0x8_0 - head - eyes
    Costumes.add_part_image(8, 1, Costumes.part_type.TEXTURE_ARRAY)                           // part 0x8_1 - head - mouth
    Costumes.define_part(A, 1, Costumes.part_type.PRIM_COLOR)                                 // part 0xA_0 - right upper arm
    Costumes.define_part(F, 1, Costumes.part_type.PRIM_COLOR)                                 // part 0xF_0 - left upper leg
    Costumes.define_part(10, 1, Costumes.part_type.PRIM_COLOR)                                // part 0x10_0 - left lower leg
    Costumes.define_part(12, 1, Costumes.part_type.PRIM_COLOR)                                // part 0x12_0 - left foot
    Costumes.define_part(14, 1, Costumes.part_type.PRIM_COLOR)                                // part 0x14_0 - right upper leg
    Costumes.define_part(15, 1, Costumes.part_type.PRIM_COLOR)                                // part 0x15_0 - right lower leg
    Costumes.define_part(17, 1, Costumes.part_type.PRIM_COLOR)                                // part 0x17_0 - right foot

    // Register extra costumes
    Costumes.register_extra_costumes_for_char(Character.id.FOX)
    Costumes.register_extra_costumes_for_char(Character.id.JFOX)

    // Costume 0x4
    scope costume_0x4 {
        palette_1:; insert "Fox/cos_4_1.bin"
        palette_2:; insert "Fox/cos_4_2.bin"

        Costumes.set_palette_for_part(0, 1, 0, palette_2)
        Costumes.set_prim_color_for_part(0, 1, 1, 0x29293100)
        Costumes.set_palette_for_part(0, 2, 0, palette_1)
        Costumes.set_prim_color_for_part(0, 2, 0, 0x4A4A4A00)
        Costumes.set_palette_for_part(0, 2, 1, palette_1)
        Costumes.set_prim_color_for_part(0, 2, 1, 0x4A4A4A00)
        Costumes.set_prim_color_for_part(0, 2, 2, 0x4A4A4A00)
        Costumes.set_prim_color_for_part(0, 2, 3, 0x4A4A4A00)
        Costumes.set_prim_color_for_part(0, 4, 0, 0x4A4A4A00)
        Costumes.set_prim_color_for_part(0, A, 0, 0x4A4A4A00)
        Costumes.set_prim_color_for_part(0, F, 0, 0x29293100)
        Costumes.set_prim_color_for_part(0, 10, 0, 0x99999900)
        Costumes.set_prim_color_for_part(0, 12, 0, 0x99999900)
        Costumes.set_prim_color_for_part(0, 14, 0, 0x29293100)
        Costumes.set_prim_color_for_part(0, 15, 0, 0x99999900)
        Costumes.set_prim_color_for_part(0, 17, 0, 0x99999900)

        Costumes.set_stock_icon_palette_for_costume(0, Fox/cos_4_stock_icon.bin)
    }

    // Costume 0x5
    scope costume_0x5 {
        palette_1:; insert "Fox/cos_5_1.bin"
        palette_2:; insert "Fox/cos_5_2.bin"

        Costumes.set_palette_for_part(1, 1, 0, palette_2)
        Costumes.set_prim_color_for_part(1, 1, 1, 0x0B1F3400)
        Costumes.set_palette_for_part(1, 2, 0, palette_1)
        Costumes.set_prim_color_for_part(1, 2, 0, 0x00D0F800)
        Costumes.set_palette_for_part(1, 2, 1, palette_1)
        Costumes.set_prim_color_for_part(1, 2, 1, 0x00D0F800)
        Costumes.set_prim_color_for_part(1, 2, 2, 0x00D0F800)
        Costumes.set_prim_color_for_part(1, 2, 3, 0x00D0F800)
        Costumes.set_prim_color_for_part(1, 4, 0, 0x00D0F800)
        Costumes.set_prim_color_for_part(1, A, 0, 0x00D0F800)
        Costumes.set_prim_color_for_part(1, F, 0, 0x0B1F3400)
        Costumes.set_prim_color_for_part(1, 10, 0, 0xFFFFFF00)
        Costumes.set_prim_color_for_part(1, 12, 0, 0xFFFFFF00)
        Costumes.set_prim_color_for_part(1, 14, 0, 0x0B1F3400)
        Costumes.set_prim_color_for_part(1, 15, 0, 0xFFFFFF00)
        Costumes.set_prim_color_for_part(1, 17, 0, 0xFFFFFF00)

        Costumes.set_stock_icon_palette_for_costume(1, Fox/cos_5_stock_icon.bin)
    }

    // Costume 0x6
    scope costume_0x6 {
        palette_1:; insert "Fox/cos_6_1.bin"
        palette_2:; insert "Fox/cos_6_2.bin"
        constant pant_color(0xf7ad0000)
        constant torso_color(0xE9E9E900)
        constant shoes_color(0xe9e9e900)

        Costumes.set_palette_for_part(2, 1, 0, palette_2)
        Costumes.set_prim_color_for_part(2, 1, 1, pant_color)
        Costumes.set_palette_for_part(2, 2, 0, palette_1)
        Costumes.set_prim_color_for_part(2, 2, 0, torso_color)
        Costumes.set_palette_for_part(2, 2, 1, palette_1)
        Costumes.set_prim_color_for_part(2, 2, 1, torso_color)
        Costumes.set_prim_color_for_part(2, 2, 2, torso_color)
        Costumes.set_prim_color_for_part(2, 2, 3, torso_color)
        Costumes.set_prim_color_for_part(2, 4, 0, torso_color)
        Costumes.set_prim_color_for_part(2, A, 0, torso_color)
        Costumes.set_prim_color_for_part(2, F, 0, pant_color)
        Costumes.set_prim_color_for_part(2, 10, 0, shoes_color)
        Costumes.set_prim_color_for_part(2, 12, 0, shoes_color)
        Costumes.set_prim_color_for_part(2, 14, 0, pant_color)
        Costumes.set_prim_color_for_part(2, 15, 0, shoes_color)
        Costumes.set_prim_color_for_part(2, 17, 0, shoes_color)

        Costumes.set_stock_icon_palette_for_costume(2, Fox/cos_6_stock_icon.bin)
    }

    // Costume 0x7
    scope costume_0x7 {
        palette_1:; insert "Fox/cos_7_1.bin"
        palette_2:; insert "Fox/cos_7_2.bin"
        constant pant_color(0x70203800)
        constant torso_color(0xFF509800)
        constant shoes_color(0xFFFFFF00)

        Costumes.set_palette_for_part(3, 1, 0, palette_2)
        Costumes.set_prim_color_for_part(3, 1, 1, pant_color)
        Costumes.set_palette_for_part(3, 2, 0, palette_1)
        Costumes.set_prim_color_for_part(3, 2, 0, torso_color)
        Costumes.set_palette_for_part(3, 2, 1, palette_1)
        Costumes.set_prim_color_for_part(3, 2, 1, torso_color)
        Costumes.set_prim_color_for_part(3, 2, 2, torso_color)
        Costumes.set_prim_color_for_part(3, 2, 3, torso_color)
        Costumes.set_prim_color_for_part(3, 4, 0, torso_color)
        Costumes.set_prim_color_for_part(3, A, 0, torso_color)
        Costumes.set_prim_color_for_part(3, F, 0, pant_color)
        Costumes.set_prim_color_for_part(3, 10, 0, shoes_color)
        Costumes.set_prim_color_for_part(3, 12, 0, shoes_color)
        Costumes.set_prim_color_for_part(3, 14, 0, pant_color)
        Costumes.set_prim_color_for_part(3, 15, 0, shoes_color)
        Costumes.set_prim_color_for_part(3, 17, 0, shoes_color)

        Costumes.set_stock_icon_palette_for_costume(3, Fox/cos_7_stock_icon.bin)
    }
}
