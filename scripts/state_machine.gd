class_name StateMachine
extends Node

@export var state: State 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_state(state)

func change_state(new_state: State):
	if state is State:
		state._exit_state()
	new_state._enter_state()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
