extends Button

@export var npcData: NPC

@onready var room = $"../Room"
@onready var animation_player = $"../../../../../../Transition/AnimationPlayer"
@onready var npcNode = $"../../../../../../Environment/NPC"
@onready var environment = $"../../../../../../Environment"
@onready var rooms = $"../../../.."
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(go)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func go():
	print("go")
	environment.newBG = room.texture
	environment.newNPC = npcData
	animation_player.play("fade_in")
	$"../../../../../../Dialogue/Portrait".hide()
	rooms.hide()
