extends Control

@export var objParent: Node
@export var clueImage: TextureRect

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in objParent.get_children():
		i.update_clue.connect(clue_notification)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clue_notification(sprite: Texture2D):
	clueImage.texture = sprite
	show()
	timer.start()

func _on_timer_timeout():
	hide()
