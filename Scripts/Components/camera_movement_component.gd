class_name CameraMovementComponent extends Node

@export_category("References")
@export var BODY:CharacterBody3D
@export var CAMERA_CONTROLLER:CameraController
@export var MOUSE_CAPTURE_COMPONENT:MouseCaptureComponent
@export_category("Camera Settings")
@export var sensitivity:float = 0.05
@export_group("Camera Tilt")
@export_range(-90, -60) var lowerTiltLimit:int = -90
@export_range(60, 90) var upperTiltLimit:int = -90

var rotation := Vector2.ZERO

var playerRotation:Vector3
var cameraRotation:Vector3

func update_camera_rotation(delta) -> void:
	if !(BODY and CAMERA_CONTROLLER and MOUSE_CAPTURE_COMPONENT):
		return
	
	rotation.x += MOUSE_CAPTURE_COMPONENT.mouseInput.y * delta
	rotation.y += MOUSE_CAPTURE_COMPONENT.mouseInput.x * delta
	rotation.x = clamp(rotation.x, deg_to_rad(lowerTiltLimit), deg_to_rad(upperTiltLimit))
	
	playerRotation = Vector3(0, rotation.y, 0)
	cameraRotation = Vector3(rotation.x, 0, 0)
	
	BODY.transform.basis = Basis.from_euler(playerRotation)
	CAMERA_CONTROLLER.transform.basis = Basis.from_euler(cameraRotation)
	
	
