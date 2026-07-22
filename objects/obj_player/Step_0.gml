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
/// @DnDArgument : "msg" "move_x"


/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 27FBDA57
/// @DnDComment : are you on the ground?
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_tilemap"
var l27FBDA57_0 = instance_place(x + 0, y + 2, [collision_tilemap]);if ((l27FBDA57_0 > 0)){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1D4034A9
	/// @DnDComment : landed on the ground.$(13_10)reset the Y of movement$(13_10)back to 0.$(13_10)
	/// @DnDParent : 27FBDA57
	/// @DnDArgument : "var" "move_y"
	move_y = 0;

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 33404EB5
	/// @DnDParent : 27FBDA57
	var l33404EB5_0;l33404EB5_0 = keyboard_check_pressed(vk_space);if (l33404EB5_0){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3D0F264C
		/// @DnDComment : update move_y$(13_10)for a jump!
		/// @DnDParent : 33404EB5
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;}}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 33CA5E5D
/// @DnDComment : you are in the air.
else{	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 552CF827
	/// @DnDComment : if we are falling$(13_10)after a jump
	/// @DnDParent : 33CA5E5D
	/// @DnDArgument : "var" "move_y"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "jump_speed"
	if(move_y < jump_speed){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2DBEFF23
		/// @DnDComment : add gravity
		/// @DnDParent : 552CF827
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "move_y"
		move_y += 1;}}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 270EACC3
/// @DnDComment : the 1st object$(13_10)listed at top here$(13_10)is the object to$(13_10)avoid
/// @DnDArgument : "xvel" "move_x"
/// @DnDArgument : "yvel" "move_y"
/// @DnDArgument : "maxxmove" "walk_speed"
/// @DnDArgument : "maxymove" "jump_speed"
/// @DnDArgument : "object" "collision_tilemap"
move_and_collide(move_x, move_y, [collision_tilemap],4,0,0,walk_speed,jump_speed);