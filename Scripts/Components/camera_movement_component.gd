class_name CameraMovementComponent extends Node

@export_category("References")
@export var BODY:CharacterBody3D
@export var CAMERA_CONTROLLER:CameraController
@export var MOUSE_CAPTURE_COMPONENT:MouseCaptureComponent


var rotation := Vector2.ZERO

var playerRotation:Vector3
var cameraRotation:Vector3

func update_camera_rotation(delta, sensitivity:float, lowerTiltLimit:float, upperTiltLimit:float) -> void:
	if !(BODY and CAMERA_CONTROLLER and MOUSE_CAPTURE_COMPONENT):
		return
	
	rotation.x += MOUSE_CAPTURE_COMPONENT.mouseInput.y * delta * sensitivity
	rotation.y += MOUSE_CAPTURE_COMPONENT.mouseInput.x * delta * sensitivity
	rotation.x = clamp(rotation.x, deg_to_rad(lowerTiltLimit), deg_to_rad(upperTiltLimit))
	
	playerRotation = Vector3(0, rotation.y, 0)
	cameraRotation = Vector3(rotation.x, 0, 0)
	
	BODY.transform.basis = Basis.from_euler(playerRotation)
	CAMERA_CONTROLLER.transform.basis = Basis.from_euler(cameraRotation)
	
	
