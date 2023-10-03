extends Button

@export var nodeToClose: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(press)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func press():
	nodeToClose.hide()

