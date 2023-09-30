extends Node2D

@onready var transition = $Transition/AnimationPlayer

@onready var gamebutton = $CanvasLayer/HBoxContainer/VertContainer/VBoxContainer/Button
@onready var save_files = $SaveFiles

@onready var saveSlot = $SaveFiles/MarginContainer/HBoxContainer/ScrollContainer/GridContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	transition._play_fade_out()
	gamebutton.pressed.connect(open_saves)
	saveSlot.pressed.connect(load_game)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_saves():
	save_files.show()

func load_game():
	get_tree().change_scene_to_file("res://Testing2/Game.tscn")
