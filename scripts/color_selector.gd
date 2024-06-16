extends AnimatedSprite2D


var selected: String = "None"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _activate() -> void:
	visible = true
	play(selected)

func _deactivate() -> void:
	visible = false

func _change_selection(selection: String):
	selected = selection
	match selection:
		"Up":
			play("Up")
		"Down":
			play("Down")
		"Left":
			play("Left")
		"Right":
			play("Right")