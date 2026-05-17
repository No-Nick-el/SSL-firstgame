class_name MovementComponent extends Node

@export_category("References")
@export var BODY:CharacterBody3D
@export var INPUT_COMPONENT:InputComponent

var movementVelocity:Vector3
var accelerationModifier:float = 1
var decelerationModifier:float = 1

func movement_update(delta:float, speed:float, acceleration:float, deceleration:float, airAcceleration:float,
airDeceleration:float, jumpForce:float) -> void:
	if !(BODY and INPUT_COMPONENT):
		return
	
	var direction = (BODY.transform.basis * Vector3(INPUT_COMPONENT.inputDirection.x,
	 0, INPUT_COMPONENT.inputDirection.y).normalized())
	
	if direction:
		movementVelocity.x = lerp(movementVelocity.x, direction.x * speed, accelerationModifier)
		movementVelocity.z = lerp(movementVelocity.z, direction.z * speed, accelerationModifier)
	else:
		movementVelocity.x = lerp(movementVelocity.x, direction.x * speed, decelerationModifier)
		movementVelocity.z = lerp(movementVelocity.z, direction.z * speed, decelerationModifier)
	
	if !BODY.is_on_floor():
		movementVelocity += BODY.get_gravity() * delta
		accelerationModifier = airAcceleration
		decelerationModifier = airDeceleration
	else:
		accelerationModifier = acceleration
		decelerationModifier = deceleration
	
	if INPUT_COMPONENT.jumpJustPressed and BODY.is_on_floor():
		movementVelocity.y = jumpForce
	
	BODY.velocity = movementVelocity
