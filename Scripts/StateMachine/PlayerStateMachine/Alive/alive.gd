extends StateMachine



func physics_update(_delta:float) -> void:
	super.physics_update(_delta)
	
	
	owner.movement_component.movement_update(_delta, owner.speed, owner.acceleration, owner.deceleration, 
	owner.airAcceleration, owner.airDeceleration, owner.jumpForce)

func handle_update(event):
	super.handle_update(event)
	owner.camera_movement_component.update_camera_rotation(event, owner.sensitivity, 
	owner.lowerTiltLimit, owner.upperTiltLimit)
