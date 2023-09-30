extends Button

@onready var environment = $"../../../../../../../Environment"

@onready var transition = $"../../../../../../../Transition/AnimationPlayer"

# // variables of room that change on click //
# room graphic
@onready var room = $"../Image"
# list of clickable objects
@export var objects: Array[PackedScene]
# character portrait
	#GOES HERE
# list of available dialogue options
	#GOES HERE

func _ready():
	pressed.connect(go_to_room)
	
func _process(delta):
	pass

func go_to_room():
	transition.play_fade_in()
	transition.fade_out_start.connect(update_room)

func update_room():
	print(name, " updating room")
	environment.change_room(room.texture)
	
	#TODO: 
		#update portrait
		#update dialogue options
		
	environment.change_objects(objects)
	transition.fade_out_start.disconnect(update_room)
