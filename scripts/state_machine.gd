class_name StateMachine
extends Node

@export var state: State 

# Called when the node enters the scene tree for the first time.
func _ready():
	_change_state(state)

func _change_state(new_state: State):
	if state is State:
		state._exit_state()
	new_state._enter_state()
	state = new_state