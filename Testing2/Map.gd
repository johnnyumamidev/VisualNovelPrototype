extends PanelContainer
@onready var transition = $"../../Transition/AnimationPlayer"
@onready var environment = $"../../Environment"

@onready var roomsParent = $MarginContainer/ScrollContainer/ROOMS

@export var roomScenes: Array[PackedScene]
var roomIndex = 0

var roomManager = RoomManager.new()

signal room_loaded()

func _ready():
	transition.fade_out_start.connect(load_start_room)
	set_starting_rooms()

func _process(delta):
	pass

func set_starting_rooms():
	var game = get_tree().root.get_child(0)
	roomManager.set_room(game)
	
	for i in roomScenes.size():
		var room = roomScenes[i].instantiate()
		roomsParent.add_child(room)
		if i == 0:
			var image = room.find_child("Image")
			environment.change_room(image.texture)

func load_start_room():
	var room = roomManager.startRoom
	
	#send room data to dialogue box script
	print("assigning dialogue")
	emit_signal("room_loaded", room.dialogue)
	transition.fade_out_start.disconnect(load_start_room)
