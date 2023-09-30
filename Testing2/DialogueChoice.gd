extends Button

@export var dialogueNodes: Array[DialogueNode]
@onready var dialogue_panel = $"../../../DialoguePanel"

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(press)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func press():
	dialogue_panel.reset_indexes()
	dialogue_panel.dialogueNodes = dialogueNodes
	dialogue_panel.display_text()
