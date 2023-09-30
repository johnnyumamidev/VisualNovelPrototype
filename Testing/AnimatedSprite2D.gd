extends AnimatedSprite2D

@export var dialogueNodes: Array[DialogueNode]

@onready var area_2d = $Area2D
@onready var dialogueScene = $"../../Dialogue/DialoguePanel"
@onready var _dialogue_box = $"../../Dialogue"

var hover = false

signal start_dialogue()

# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	area_2d.mouse_entered.connect(hover_true)
	area_2d.mouse_exited.connect(hover_false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click") && hover:
		hide()
		
		if !dialogueScene.is_active:
			_dialogue_box.show()
			dialogueScene.display_text()

func hover_true():
	dialogueScene.dialogueNodes = self.dialogueNodes
	
	hover = true
	
func hover_false():
	hover = false
	
func show_npc():
	show()
	print(name, " show")
