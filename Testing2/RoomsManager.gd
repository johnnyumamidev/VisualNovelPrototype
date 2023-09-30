extends Node
class_name RoomManager

var objects = null
var startRoom = preload("res://Testing2/Resource/room00.tres")
# Called when the node enters the scene tree for the first time.

func set_room(game: Node):
	get_objs_parent(game)
	place_objects()

func get_objs_parent(game: Node):
	for i in game.get_children():
		if i.name == "Environment":
			for j in i.get_children():
				if j.name == "Objects":
					objects = j

func place_objects():
	for i in startRoom.objects:
		var obj = i.instantiate()
		objects.add_child(obj)
