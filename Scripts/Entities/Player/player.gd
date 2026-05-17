class_name Player extends CharacterBody3D

@onready var input_component: InputComponent = $Components/InputComponent
@onready var movement_component: MovementComponent = $Components/MovementComponent
@onready var camera_movement_component: CameraMovementComponent = $Components/CameraMovementComponent
@onready var mouse_capture_component: MouseCaptureComponent = $Components/MouseCaptureComponent


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
	movement_component.movement_update(delta)
	
	camera_movement_component.update_camera_rotation(delta)
	
	move_and_slide()
