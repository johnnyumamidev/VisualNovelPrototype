extends Sprite2D

@onready var area = $Area2D
@export var objName: String
@export_multiline var objDescription: String
var hover = false

@export var dialogueNodes: Array[DialogueNode]
var dialogue
var clues

func _ready():
	name = objName
	
	add_to_group("Objects")
	dialogue = get_tree().get_nodes_in_group("Dialogue")[0]
	clues = get_tree().get_nodes_in_group("Clues")[0]
	
	
	area.mouse_entered.connect(hover_true)
	area.mouse_exited.connect(hover_false)

func _process(delta):
	if dialogue.is_active:
		hover = false
	
	if hover:
		scale = Vector2(1.1,1.1)
	else: 
		scale = Vector2(1,1)
	
	if Input.is_action_just_pressed("click"):
		if hover && !dialogue.is_active:
			inspect()

func hover_true():
	hover = true

func hover_false():
	hover = false
	
func inspect():
	dialogue.clue_added.connect(add_clue)
	
	print("inspect ", objName)
	area.hide()
	
	dialogue.dialogueNodes = dialogueNodes
	dialogue.nodeIndex = 0
	dialogue.display_text()

func add_clue():
	clues.add_clue(objName, objDescription, texture)
	dialogue.clue_added.disconnect(add_clue)
	
