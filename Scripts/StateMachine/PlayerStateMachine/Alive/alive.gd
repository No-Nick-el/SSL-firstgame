extends StateMachine

@export var debug:bool = false
@export_category("References")
@export var player:Player
@export var cameraController:CameraController

@export_category("Mouse Capture Settings")
@export var currentMouseMode:Input.MouseMode = Input.MOUSE_MODE_CAPTURED
@export var mouseSensitivity:float = 0.0025

@export_category("Camera Settings")
@export_group("Camera Tilt")
@export_range(-90, -60) var tiltLowerLimit = -90
@export_range(60, 90) var tiltUpperLimit = 90

var captureMouse:bool
var mouseInput:Vector2

func enter() -> void:
	Input.mouse_mode = currentMouseMode

func physics_update(delta:float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()


func handle_update(event):
	captureMouse = event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if captureMouse:
		mouseInput.x -= event.relative.x * mouseSensitivity
		mouseInput.y -= event.relative.y * mouseSensitivity
		mouseInput.y = clamp(mouseInput.y, deg_to_rad(tiltLowerLimit), deg_to_rad(tiltUpperLimit))
		
		var playerRotation = Vector3(0, mouseInput.x, 0)
		var cameraRotation = Vector3(mouseInput.y, 0, 0)
		
		player.transform.basis = Basis.from_euler(playerRotation)
		cameraController.transform.basis = Basis.from_euler(cameraRotation)
