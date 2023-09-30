extends Button

@onready var vision = $"../../../../../SpiritVision"

func _ready():
	vision.hide()
	pressed.connect(enable_vision)

func _process(delta):
	pass

func enable_vision():
	vision.visible = !vision.visible
