class_name InputComponent extends Node

var inputDirection:Vector2 = Vector2.ZERO
var jumpPressed:bool = false
var crouchPressed:bool = false
var sprintPressed:bool = false

func _process(delta: float) -> void:
	inputDirection = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	jumpPressed = Input.is_action_pressed("jump")
	crouchPressed = Input.is_action_pressed("crouch")
