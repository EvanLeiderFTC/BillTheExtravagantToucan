/// @DnDAction : YoYo Games.Particles.Effect
/// @DnDVersion : 1
/// @DnDHash : 0D719E7C
/// @DnDApplyTo : other
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "type" "7"
/// @DnDArgument : "size" "2"
/// @DnDArgument : "color" "$FF00F6FF"
with(other) effect_create_below(7, x + 0, y + 0, 2, $FF00F6FF & $ffffff);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 0C019358
/// @DnDApplyTo : other
with(other) instance_destroy();