extends Control

@onready var dialogue = %Dialogue
@onready var character = $Character
@onready var sentence = $Sentence
@onready var line_complete_icon = $LineCompleteIcon
@onready var portrait = $"../Portrait"

@export var dialogueNodes: Array[DialogueNode]
@export var currentDialogueNode: DialogueNode
@export var text_array: Array[String]

var nodeIndex = 0
var textArrayIndex = 0
var visibleCharIndex = 0

var totalCharacters = 0

var typing = false
var is_active = false
var lines_complete = false
var no_nodes_left = false

signal start_dialogue()
signal end_dialogue()

func _ready():
	hide()
	dialogue.text = ""

func _process(delta):
	#update current node and available dialogue lines
	currentDialogueNode = dialogueNodes[nodeIndex]
	text_array = currentDialogueNode.dialogueLines
	
	dialogue.visible_characters = visibleCharIndex
	totalCharacters = strip_bbcode(dialogue.text).length()

func display_text():
	print("index: ", textArrayIndex)
	show()
	emit_signal("start_dialogue")
	portrait.show()
	line_complete_icon.hide()
	typing = true
	is_active = true
	
	if lines_complete:
		print("clearing text for next node, current node: ", nodeIndex)
		dialogue.text = ""
		textArrayIndex = 0
		visibleCharIndex = 0
		lines_complete = false
	
	dialogue.text += text_array[textArrayIndex]
	character.start()

func strip_bbcode(source:String) -> String:
	var regex = RegEx.new()
	regex.compile("\\[.+?\\]")
	return regex.sub(source, "", true)

func _on_character_timeout():
	visibleCharIndex += 1
	
	if dialogue.visible_characters == totalCharacters-1:
		print(visibleCharIndex, "/", totalCharacters, "reached end of line")
		character.stop()
		
		if textArrayIndex < text_array.size() - 1:
			textArrayIndex += 1
			sentence.start()
		else:
			if nodeIndex < dialogueNodes.size() - 1:
				nodeIndex += 1
				print("end of node, next node: ", nodeIndex)
			else:
				print("no nodes left")
				no_nodes_left = true
			line_complete_icon.show()
			
			typing = false
			lines_complete = true

func close_dialogue():
	hide()
	emit_signal("end_dialogue")
	no_nodes_left = false
	is_active = false

func _on_sentence_timeout():
	display_text()
	sentence.stop()

func reset_indexes():
	nodeIndex = 0
