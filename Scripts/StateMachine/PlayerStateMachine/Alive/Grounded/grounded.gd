extends StateMachine

@export var player:Player
@export var input:InputComponent

func enter() -> void:
	print("ground")

func physics_update(delta:float) -> void:
	if !player.is_on_floor():
		transition.emit("Airborn")
