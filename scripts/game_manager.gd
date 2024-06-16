extends Node


@export var player: CharacterBody2D
@export var color_selector: AnimatedSprite2D
@export var time_slow_scale: float = 0.25

func _ready() -> void:
	player.selection_state_entered.connect(color_selector._activate)
	player.selection_state_entered.connect(_slow_time)
	player.selection_state_exited.connect(color_selector._deactivate)
	player.selection_state_exited.connect(_regular_time_scale)
	player.selection_state_output.connect(color_selector._change_selection)

func _slow_time() -> void:
	Engine.time_scale = time_slow_scale

func _regular_time_scale() -> void:
	Engine.time_scale = 1