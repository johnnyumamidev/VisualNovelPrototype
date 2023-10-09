extends Control

@export var dialogue: Control
@export var button: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue.open_inspection.connect(inspection)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func inspection():
	print(name, " inspection")
	var _button = button.instantiate()
	add_child(_button)

func add_clue():
	print(name, " close")
