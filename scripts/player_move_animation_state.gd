class_name PlayerMoveAnimationState
extends State

@export var player_sprite: AnimatedSprite2D

func _ready():
	set_process(false)

func _enter_state() -> void:
	set_process(true) 

func _exit_state() -> void:
	set_process(false) 

func _process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")  

	if direction == 0:
		player_sprite.play("idle")
	else:
		player_sprite.play("run")
