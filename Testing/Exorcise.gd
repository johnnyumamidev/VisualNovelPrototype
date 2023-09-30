extends Button

@onready var menu = $"../../../../../DeductionMenu"
@onready var actions = $"../../../.."

func _ready():
	pressed.connect(show_menu)
	
func show_menu():
	menu.visible = !menu.visible
	actions.hide()
