/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7CDDCAF5
/// @DnDComment : if vk_right is pressed,$(13_10)vk_right would be 1.$(13_10)$(13_10)if vk_left is pressed,$(13_10)vk_left would be 1.$(13_10)$(13_10)So, this formula subtracts$(13_10)vk_left from vk_right,$(13_10)in realtime.$(13_10)$(13_10)Essentially,$(13_10)move_x would be 1 if$(13_10)player is pressing right,$(13_10)-1 if player is pressing left,$(13_10)and 0 if player is not pressing either,$(13_10)or is pressing both at the same time.
/// @DnDArgument : "expr" "keyboard_check(vk_right) - keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0066C3C9
/// @DnDArgument : "expr" "move_x * walk_speed"
/// @DnDArgument : "var" "move_x"
move_x = move_x * walk_speed;

/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 438146EC
/// @DnDDisabled : 1
/// @DnDArgument : "msg" ""