extends CanvasLayer

var actionNodes: Array[Node]

@export var environment: Node
@export var transition: AnimationPlayer

@onready var dialogue = $Dialogue
@onready var actions = $Actions
@onready var inspect = $Inspect

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in actions.get_child_count():
		var button = actions.get_child(i)
		button.down.connect(open)
		actionNodes.append(button.node)
	
	var dialoguePanel = $DialoguePanel
	dialoguePanel.end_dialogue.connect(show_actions)
	dialoguePanel.start_dialogue.connect(hide_actions)
	dialoguePanel.open_inspection.connect(open_inspection_panel)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open(node: Node):
	node.visible = !node.visible
	
	if node == inspect:
		print("inspect")
		environment.hide_portrait()
		environment.objects.visible = !environment.objects.visible
	else:
		print(node.name)
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

func open_inspection_panel():
	print("opening inspection panel")
	var inspectionPanel = $Inspect/Inspection
	inspectionPanel.show()
