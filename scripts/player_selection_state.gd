class_name PlayerSelectionState
extends State

@export var player: CharacterBody2D

signal _output(output: String)
signal _entered
signal _exited

func _ready():
	set_process_input(false)

func _enter_state() -> void:
	_entered.emit()
	set_process_input(true)

func _exit_state() -> void:
	_exited.emit()
	set_process_input(false)

func _input(event: InputEvent):
	var direction := event.as_text()
	print(direction)
	match direction:
		"W":
			_output.emit("up")
		"S":
			_output.emit("down")
		"A":
			_output.emit("left")
		"D":
			_output.emit("right")
