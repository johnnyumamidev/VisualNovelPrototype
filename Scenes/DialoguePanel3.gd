extends Control

@onready var map = $"../Map"

@onready var character_name = %CharacterName
@onready var dialogue = %Dialogue
@onready var character = $Character
@onready var sentence = $Sentence
@onready var line_complete_icon = $LineCompleteIcon

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
signal reveal_portrait()
signal open_inspection()

func _ready():
	map.room_loaded.connect(get_room_dialogue)
	
	hide()
	dialogue.text = ""

func get_room_dialogue(nodes: Array[DialogueNode]):
	dialogueNodes = nodes
	
func _process(delta):
	dialogue.visible_characters = visibleCharIndex
	totalCharacters = strip_bbcode(dialogue.text).length()

func set_dialogue():
	#update current node and available dialogue lines
	currentDialogueNode = dialogueNodes[nodeIndex]
	text_array = currentDialogueNode.dialogueLines
	character_name.text = dialogueNodes[nodeIndex].charName

func display_text():
	set_dialogue()
	if currentDialogueNode.revealPortrait:
		emit_signal("reveal_portrait", currentDialogueNode.portrait)
	
	print("line index: ", textArrayIndex)
	show()
	emit_signal("start_dialogue")
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

func _on_character_timeout():
	visibleCharIndex += 1
	
	if dialogue.visible_characters == totalCharacters-1:
		print(visibleCharIndex, "/", totalCharacters, " reached end of line")
		character.stop()
		
		if textArrayIndex < text_array.size() - 1:
			print("--- starting next line ---")
			textArrayIndex += 1
			sentence.start()
		else:
			print("+++ last line in node reached +++")
			if nodeIndex < dialogueNodes.size() - 1:
				nodeIndex += 1
				print("end of node, next node: ", nodeIndex)
			else:
				no_nodes_left = true
				print("no nodes left ", no_nodes_left)
			line_complete_icon.show()
			
			typing = false
			lines_complete = true

func _on_sentence_timeout():
	display_text()
	sentence.stop()

func close_dialogue():
	hide()
	emit_signal("end_dialogue")
	no_nodes_left = false
	is_active = false
	
	if currentDialogueNode.open_inspection:
		emit_signal("open_inspection")

func reset_indexes():
	nodeIndex = 0
	
func strip_bbcode(source:String) -> String:
	var regex = RegEx.new()
	regex.compile("\\[.+?\\]")
	return regex.sub(source, "", true)
