extends Button

var dialogue
@export var dialogueNodes: Array[DialogueNode]

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(press)
	
	dialogue = get_tree().get_nodes_in_group("Dialogue")[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func press():
	get_parent().hide()
	
	dialogue.dialogueNodes = dialogueNodes
	dialogue.nodeIndex = 0
	dialogue.display_text()
