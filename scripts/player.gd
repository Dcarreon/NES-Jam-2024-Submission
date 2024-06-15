extends CharacterBody2D


@export var SPEED = 200.0
@export var JUMP_VELOCITY = -325.0

@onready var animated_sprite := $AnimatedSprite2D
@onready var input_state := $InputState
@onready var move_state := $InputState/PlayerMoveState

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

#	# Direction = 1 signifies that the sprite is moving right. Direction = -1 sigifies that it's moving left
#	# By default the sprite faces right
#	if direction > 0:
#		animated_sprite.flip_h = false;
#	elif direction < 0:
#		animated_sprite.flip_h = true;
#
#	if is_on_floor():
#		if direction == 0:
#			animated_sprite.play("idle")
#		else:
#			animated_sprite.play("run")
#	else:
#		animated_sprite.play("jump")

	move_and_slide()
