class_name PlayerMoveState
extends State

#@onready var player = $player
@export var player: CharacterBody2D

func _ready():
    set_physics_process(false)

func _enter_state() -> void:
    set_physics_process(true)

func _exit_state() -> void:
    set_physics_process(false)

func _physics_process(delta: float) -> void:
    var direction := Input.get_axis("move_left", "move_right")

    if direction:
        player.velocity.x = direction * player.SPEED
    else:
        player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)	

    player.move_and_slide()