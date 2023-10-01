extends Sprite2D

@onready var area = $Area2D
@export var objName: String
var hover = false

var dialogue
@export var dialogueNodes: Array[DialogueNode]

func _ready():
	name = objName
	
	dialogue = get_tree().get_nodes_in_group("Dialogue")[0]
	
	area.mouse_entered.connect(hover_true)
	area.mouse_exited.connect(hover_false)

func _process(delta):
	
	if Input.is_action_just_pressed("click"):
		if hover && !dialogue.is_active:
			inspect()

func hover_true():
	hover = true
	scale = Vector2(1.1,1.1)

func hover_false():
	hover = false
	scale = Vector2(1,1)
	
func inspect():
	print("inspect ", objName)
	dialogue.dialogueNodes = dialogueNodes
	dialogue.nodeIndex = 0
	dialogue.display_text()
