extends CanvasLayer

var actionNodes: Array[Node]

@onready var environment = $"../Environment"

@onready var dialogue = $Dialogue
@onready var actions = $Actions
@onready var transition = $"../Transition/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in actions.get_child_count():
		var button = actions.get_child(i)
		button.down.connect(open)
		actionNodes.append(button.node)
	
	var dialoguePanel = $DialoguePanel
	dialoguePanel.end_dialogue.connect(show_actions)
	dialoguePanel.start_dialogue.connect(hide_actions)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open(node: Node):
	node.visible = !node.visible
	
	if node.name == "Inspect":
		environment.hide_portrait()
		environment.objects.visible = !environment.objects.visible
	else:
		environment.show_portrait()
		environment.objects.hide()
	
	for i in actionNodes:
		if i == node:
			print(i.name, " ,", i.visible)
		else:
			i.hide()

func enable_disable_buttons(set: bool):
	actions.visible = set
#	for i in actions.get_child_count():
#		var button = actions.get_child(i)
#		button.disabled = set

func show_actions():
	actions.show()
	
func hide_actions():
	actions.hide()
