extends CanvasLayer

@onready var dialogue_panel = $"../Dialogue/DialoguePanel"

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	dialogue_panel.end_dialogue.connect(show_actions)
	dialogue_panel.start_dialogue.connect(hide_actions)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hide_actions():
	print("hide actions")
	hide()

func show_actions():
	show()
