class_name PlayerSelectionState
extends State

@export player: CharacterBody2D

signal selection_state_up
signal selection_state_down
signal selection_state_left
signal selection_state_right

func _ready():
    _set_process(false)

func _enter_state() -> void:
    _set_process(true)

func _exit_state() -> void:
    _set_process(false)

func _process() -> void:
    pass