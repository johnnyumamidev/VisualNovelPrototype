extends CanvasLayer

@export var clueImage: TextureRect
@export var clueText: Label
@export var clueContainer: Node

@export var clueButton: PackedScene

func _ready():
	pass 

func _process(delta):
	pass

func add_clue(_text: String, clueDescription: String, image: Texture2D):
	var clue = clueButton.instantiate()
	clueContainer.add_child(clue)
	clue.clueDesc = clueDescription
	clue.clueSprite = image
	
	clue.clue_pressed.connect(change_clue_display)
	clue.text = _text
	print("add ", _text, " to clues")
	
func change_clue_display(text: String, image: Texture2D):
	clueText.text = text
	clueImage.texture = image
