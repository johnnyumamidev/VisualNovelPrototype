extends CanvasLayer

@export var buttonCount = 0
var currentButton = 0
@onready var buttonsContainer = $HScrollBar/HBoxContainer
@onready var label = $PanelContainer2/MarginContainer/Label
@export var buttons: Array[Button]
@onready var close = $CLOSE
@onready var actions = $"../Actions"

signal set_clue_info

var clueScript = load("res://Testing/ClueButton.gd")

@export var info: String

# Called when the node enters the scene tree for the first time.
func _ready():
	close.pressed.connect(close_menu)
	
	for i in buttonCount:
		
		var button = Button.new()
		button.set_script(clueScript)
		
		currentButton = i
		button.text = str("Clue #", i + 1)
		buttonsContainer.add_child(button)
		button.pressed.connect(on_press)
		connect("set_clue_info", set_clue)

func on_press():
	emit_signal("set_clue_info", info)
	
func set_clue(_info: String):
	label.text = _info

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close_menu():
	hide()
	actions.show()
