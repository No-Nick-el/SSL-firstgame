class_name MovementComponent extends Node

@export_category("References")
@export var BODY:CharacterBody3D
@export var INPUT_COMPONENT:InputComponent
@export_category("Movement Settings")
@export var speed:float = 5
@export var acceleration:float
@export var deceleration:float
@export var jumpForce:float = 3

var jumpAllowed := false

func movement_update(delta:float) -> void:
	if !(BODY and INPUT_COMPONENT):
		return
	
	var direction = (BODY.transform.basis * Vector3(INPUT_COMPONENT.inputDirection.x,
	 0, INPUT_COMPONENT.inputDirection.y).normalized())
	
	BODY.velocity.x = direction.x * speed
	BODY.velocity.z = direction.z * speed
	
	if !BODY.is_on_floor():
		BODY.velocity += BODY.get_gravity() * delta
	
	if jumpAllowed and BODY.is_on_floor():
		BODY.velocity.y += jumpForce
		jumpAllowed = false
