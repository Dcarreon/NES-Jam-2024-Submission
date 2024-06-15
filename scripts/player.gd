extends CharacterBody2D


@export var SPEED = 200.0
@export var JUMP_VELOCITY = -325.0

@onready var animated_sprite := $AnimatedSprite2D
@onready var input_state := $InputState
@onready var animation_state := $AnimationState
@onready var move_state := $InputState/PlayerMoveState
@onready var selection_state := $InputState/PlayerSelectionState

signal selection_state_output(output: String)
signal selection_state_entered
signal selection_state_exited

var is_idle: bool = false;

func _ready():
	selection_state._entered.connect(emit_selection_state_entered)
	selection_state._exited.connect(emit_selection_state_exited)
	selection_state._output.connect(emit_selection_state_output)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("b_button") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("a_button"):
		is_idle = true
		input_state._change_state(selection_state)
	elif Input.is_action_just_released("a_button"):
		is_idle = false
		input_state._change_state(move_state)

	move_and_slide()

func emit_selection_state_entered():
	selection_state_entered.emit()

func emit_selection_state_exited():
	selection_state_exited.emit()

func emit_selection_state_output(output: String):
	selection_state_output.emit(output)
