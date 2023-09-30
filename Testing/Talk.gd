extends Button

@onready var choices = $"../../../../../Choices"

# Called when the node enters the scene tree for the first time.
func _ready():
	choices.hide()
	pressed.connect(show_choices)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_choices():
	choices.visible = !choices.visible
