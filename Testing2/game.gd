extends Node2D

@onready var dialogue = $Gameplay/DialoguePanel
@onready var transition = $Transition/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	transition._play_fade_out()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		if dialogue.lines_complete:
			if !dialogue.typing && dialogue.is_active:
				if dialogue.no_nodes_left:
					dialogue.close_dialogue()
				else:
					dialogue.display_text()
		elif !dialogue.is_active:
			dialogue.display_text()
