// @ Description
// This should match the number of calls to add_sprite_info_array
constant NUM_SPRITE_INFO_ARRAYS(0x01)

// @ Description
// Not sure what the data is at this offset.
constant STAGE_FILE_OFFSET(0x000098A0)

// @ Description
// Here, need to add a sprite info array for each sprite animation option
sprite_info_arrays:
// bi-directional, one UFO only
Stages.add_sprite_info_array(0x0000, 0x0000, 0x0, 0x01)

// @ Description
// Finally, each sprite will have data associated with it that is 0x40 in size.
// This data is found via the pointer at 0xC in the bg info struct.
// Stuff them into a file and insert here.
insert sprite_data, "spiralm.bin"