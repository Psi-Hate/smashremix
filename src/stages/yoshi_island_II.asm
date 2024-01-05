// @ Description
// This should match the number of calls to add_sprint_info_array
constant NUM_SPRITE_INFO_ARRAYS(0x07)

// @ Description
// Not sure what the data is at this offset.
constant STAGE_FILE_OFFSET(0x0000B668)

// @ Description
// Here, need to add a sprite info array for each sprite animation option
sprite_info_arrays:
// 
Stages.add_sprite_info_array(0x0003, 0x0000, 0x0, 0x02)
// 
Stages.add_sprite_info_array(0x0003, 0x0001, 0x0, 0x01)
// 
Stages.add_sprite_info_array(0x0001, 0x0000, 0xF, 0x01)
// 
Stages.add_sprite_info_array(0x0002, 0x0000, 0x3, 0x01)
// 
Stages.add_sprite_info_array(0x0004, 0x0000, 0x0, 0x01)
// 
Stages.add_sprite_info_array(0x0005, 0x0000, 0x0, 0x01)
// 
Stages.add_sprite_info_array(0x0000, 0x0000, 0x0, 0x04)

// @ Description
// Finally, each sprite will have data associated with it that is 0x40 in size.
// This data is found via the pointer at 0xC in the bg info struct.
// Stuff them into a file and insert here.
insert sprite_data, "yoshi_island_ii.bin"
