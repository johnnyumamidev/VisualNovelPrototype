extends Button

@onready var map = $"../../../../../Map/ROOMS"
@onready var actions = $"../../../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	map.hide()
	pressed.connect(_open_map)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _open_map():
	actions.hide()
	map.visible = !map.visible
