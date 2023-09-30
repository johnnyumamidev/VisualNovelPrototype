extends CanvasLayer

@onready var choices = $HBoxContainer
@onready var dialogue_panel = $"../DialoguePanel"

@onready var main = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in choices.get_child_count():
		var choice = choices.get_child(i)
		if choice.get_class() != "Button":
			continue
		
		choice.pressed.connect(press)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func press():
	hide()
