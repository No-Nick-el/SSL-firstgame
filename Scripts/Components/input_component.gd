class_name InputComponent extends Node

var inputDirection:Vector2 = Vector2.ZERO
var jumpJustPressed:bool = false
var crouchPressed:bool = false
var sprintPressed:bool = false
var usePressed:bool = false
var exitPressed:bool = false

func _process(delta: float) -> void:
	inputDirection = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	jumpJustPressed = Input.is_action_just_pressed("jump")
	crouchPressed = Input.is_action_pressed("crouch")
	sprintPressed = Input.is_action_pressed("sprint")
	usePressed = Input.is_action_pressed("use")
	exitPressed = Input.is_action_pressed("exit")
	
	if exitPressed: get_tree().quit()
