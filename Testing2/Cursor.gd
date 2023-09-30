extends Control

@export var cursorGraphic: Texture2D
var cursor
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	cursor = Sprite2D.new()
	cursor.texture = cursorGraphic
	add_child(cursor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cursor.position = get_viewport().get_mouse_position()
