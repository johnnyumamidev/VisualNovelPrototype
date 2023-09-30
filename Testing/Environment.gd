extends CanvasLayer

@onready var bg = $BG
@export var currentBg: Texture2D

@onready var npc = $NPC

var newNPC: NPC
var newBG: Texture2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_npc():
	npc.dialogueNodes = newNPC.dialogueNodes
	npc.sprite_frames = newNPC.spriteFrames

func update_bg():
	bg.texture = newBG
