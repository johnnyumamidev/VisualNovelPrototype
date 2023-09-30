extends Button

@onready var dialogue_panel = $".."
@onready var main = $"../.."
@onready var actions = $"../../Actions"

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(press)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func press():
	dialogue_panel.hide()
	main.enable_disable_buttons(false)
	actions.show()
