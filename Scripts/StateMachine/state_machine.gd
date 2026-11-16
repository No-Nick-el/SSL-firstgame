class_name StateMachine extends State

@export var initialState:State
var currentState:State
var states:Dictionary = {}

func _ready() -> void:
	await owner.ready
	
	register_states(self)
	
	if initialState:
		currentState = initialState
		currentState.enter()

func register_states(node:Node):
	for child in node.get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(on_child_transition)
			register_states(child)

func _process(delta: float) -> void:
	if currentState:
		currentState.update(delta)

func _physics_process(delta: float) -> void:
	if currentState:
		currentState.physics_update(delta)

func _unhandled_input(event: InputEvent) -> void:
	if currentState:
		currentState.handle_update(event)

func on_child_transition(state, new_state_name):
	var newState = states.get(new_state_name.to_lower())
	if !newState or newState == currentState:
		return
	
	if currentState:
		currentState.exit()
		currentState = newState
		currentState.enter()
	else:
		push_warning("StateMachine: состояние не найдено -> " + new_state_name)
