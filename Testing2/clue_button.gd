extends Button

var clueDesc: String
var clueSprite: Texture2D

signal clue_pressed(text: String, image: Texture2D)

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(change_clue_display)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_clue_display():
	emit_signal("clue_pressed", clueDesc, clueSprite)
