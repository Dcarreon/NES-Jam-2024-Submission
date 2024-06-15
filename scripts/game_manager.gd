extends Node


@export var player: CharacterBody2D
@export var color_selector: AnimatedSprite2D

func _ready() -> void:
	player.selection_state_entered.connect(color_selector._activate)
	player.selection_state_exited.connect(color_selector._deactivate)
	player.selection_state_output.connect(color_selector._change_selection)