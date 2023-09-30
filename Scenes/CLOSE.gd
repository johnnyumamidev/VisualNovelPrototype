extends TextureButton

@onready var actions = $"../../Actions"

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(close_menu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close_menu():
	hide()
	actions.show()
