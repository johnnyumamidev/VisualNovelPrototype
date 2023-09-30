extends Button

@onready var transition = $"../../../Transition/AnimationPlayer"
@onready var actions = $".."

@export var node: Node

signal down

func _ready():
	pressed.connect(press)
	transition.fade_out_start.connect(hide_node)

func press():
	emit_signal("down", node)

func hide_node():
	node.hide()
