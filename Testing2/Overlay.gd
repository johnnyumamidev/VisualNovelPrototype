extends Control

@export var dialogue: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue.show_overlay.connect(show)
	dialogue.hide_overlay.connect(hide)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
