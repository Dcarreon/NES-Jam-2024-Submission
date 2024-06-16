class_name PlayerMoveAnimationState
extends State

@export var player: CharacterBody2D
@export var player_sprite: AnimatedSprite2D

func _ready():
	set_process(false)

func _enter_state() -> void:
	set_process(true) 

func _exit_state() -> void:
	set_process(false) 

func _process(delta: float) -> void:
	var direction := Input.get_axis("dpad_left", "dpad_right")  

	if not player.is_idle:
		if direction > 0:
			player_sprite.flip_h = false;
		elif direction < 0:

			player_sprite.flip_h = true;
		if direction == 0:
			player_sprite.play("idle")
		else:
			player_sprite.play("run")

		if not player.is_on_floor():
			player_sprite.play("jump")
	else:
		player_sprite.play("jump")