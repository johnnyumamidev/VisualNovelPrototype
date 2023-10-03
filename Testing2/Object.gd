extends Sprite2D

@onready var area = $Area2D
@export var objName: String

var canClick = true
var hover = false

@export var dialogueNodes: Array[DialogueNode]
var dialogue

@export var containsClue: bool

func _ready():
	name = objName
	
	add_to_group("Objects")
	dialogue = get_tree().get_nodes_in_group("Dialogue")[0]
	
	area.mouse_entered.connect(hover_true)
	area.mouse_exited.connect(hover_false)

func _process(delta):
	
	if Input.is_action_just_pressed("click"):
		if canClick && hover && !dialogue.is_active:
			inspect()

func hover_true():
	hover = true
	scale = Vector2(1.1,1.1)

func hover_false():
	hover = false
	scale = Vector2(1,1)
	
func inspect():
	var objects = get_tree().get_nodes_in_group("Objects")
	for i in objects:
		i.canClick = false
		print(i, " can click = ", i.canClick)
	
	print("inspect ", objName)
	dialogue.dialogueNodes = dialogueNodes
	dialogue.nodeIndex = 0
	dialogue.display_text()
	
	if containsClue:
		print("add to clues")
