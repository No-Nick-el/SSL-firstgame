class_name State extends Node

signal transition(new_state_name:StringName)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta:float) -> void:
	if get_parent() is State:
		get_parent().update(delta)

func physics_update(delta:float) -> void:
	if get_parent() is State:
		get_parent().physics_update(delta)

func handle_update(event):
	if get_parent() is State:
		get_parent().handle_update(event)
