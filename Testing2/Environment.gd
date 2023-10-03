extends Node2D

@onready var bg = $BG
@onready var portrait = $Portrait
@onready var objects = $Objects
@onready var dialogue_panel = $"../Gameplay/DialoguePanel"

func _ready():
	#starting room bg
	dialogue_panel.reveal_portrait.connect(change_portrait)
	objects.hide()

func _process(delta):
	pass

func change_room(_new_bg: Texture2D):
	bg.texture = _new_bg

func show_portrait():
	print("show portrait")
	portrait.show()

func hide_portrait():
	portrait.hide()

func change_portrait(spriteFrames: SpriteFrames):
	#change portrait sprite
	portrait.sprite_frames = spriteFrames
	show_portrait()

func change_objects(newObjects: Array[PackedScene]):
	for i in objects.get_children():
		i.queue_free()
	
	for obj in newObjects:
		print("new obj")
		var newObj = obj.instantiate()
		objects.add_child(newObj)
