extends Node2D

@onready var endScene = $CanvasLayer/DialoguePanel/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	endScene.pressed.connect(_end_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _end_scene():
	get_tree().change_scene_to_file("res://Testing2/Game.tscn")
