class_name Player extends CharacterBody3D

@onready var input_component: InputComponent = $Components/InputComponent
@onready var movement_component: MovementComponent = $Components/MovementComponent
@onready var camera_movement_component: CameraMovementComponent = $Components/CameraMovementComponent
@onready var mouse_capture_component: MouseCaptureComponent = $Components/MouseCaptureComponent

@export_category("Movement Settings")
@export var speed:float = 5
@export var acceleration:float = 0.5
@export var deceleration:float = 0.3
@export var airAcceleration:float = 0.1
@export var airDeceleration:float = 0.001
@export var jumpForce:float = 4.5
@export_category("Camera Settings")
@export var sensitivity:float = 0.05
@export_group("Camera Tilt")
@export_range(-90, -60) var lowerTiltLimit:int = -90
@export_range(60, 90) var upperTiltLimit:int = 90

func _physics_process(delta: float) -> void:
	
	movement_component.movement_update(delta, speed, acceleration, deceleration, airAcceleration,
	airDeceleration, jumpForce)
	
	camera_movement_component.update_camera_rotation(delta, sensitivity, lowerTiltLimit, upperTiltLimit)
	
	move_and_slide()
