extends Node2D

var name_array: Array[String] = ["BOB", "greg", "frank"]

@export var on = false

@export var speed = 1
@onready var animationPlayer = $CanvasLayer/Transition/AnimationPlayer
@onready var dialogue = $Dialogue/DialoguePanel
@onready var spiritMenu = $CanvasLayer2
@onready var _dialogue = $Dialogue

func _ready():
	_dialogue.hide()
	
func _process(delta):
	if Input.is_action_just_pressed("click"):
		if dialogue.lines_complete:
			_dialogue.show()
			if dialogue.no_nodes_left:
				dialogue.close_dialogue()
			elif !dialogue.typing && dialogue.is_active:
				dialogue.display_text()
		
		#dialogue.typeDialogue = true
		
#		if !dialogue.is_active:
#			dialogue.display_text()
#		if dialogue.can_advance_line:
#			dialogue.next_line()

	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
		
#	if Input.is_action_just_pressed("open"):
#		$Actions.show()
