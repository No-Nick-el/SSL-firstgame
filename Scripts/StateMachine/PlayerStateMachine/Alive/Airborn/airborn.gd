extends StateMachine

@export var player:Player

func enter() -> void:
	print("air")

func physics_update(delta:float) -> void:
	owner.move_and_slide()
	player.velocity += player.get_gravity() * delta
	if player.is_on_floor():
		transition.emit("Grounded")
