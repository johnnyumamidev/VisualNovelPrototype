extends MenuButton

@onready var char_label = $"../Label"

@export var names: Array[String]
var index = 0

func _ready():
	for name in names:
		add_item(names[index])
		index += 1

func add_item(name: String):
	get_popup().add_item(name)
	get_popup().connect("id_pressed", _on_item_pressed)

func _on_item_pressed(id):
	var item_name = get_popup().get_item_text(id)
	char_label.text = item_name
