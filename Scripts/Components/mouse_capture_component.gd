class_name MouseCaptureComponent extends Node

@export var debug:bool = false
@export_category("Mouse Capture Settings")
@export var currentMouseMode:Input.MouseMode = Input.MOUSE_MODE_CAPTURED
@export var mouseSensitivity:float = 0.05

var captureMode:bool
var mouseInput:Vector2

func _unhandled_input(event: InputEvent) -> void:
	captureMode = event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if captureMode:
		mouseInput.x = -event.screen_relative.x * mouseSensitivity
		mouseInput.y = -event.screen_relative.y * mouseSensitivity
	if debug:
		print(mouseInput)

func _ready() -> void:
	Input.mouse_mode = currentMouseMode

func _process(delta: float) -> void:
	mouseInput = Vector2.ZERO
