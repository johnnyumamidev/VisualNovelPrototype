extends AnimationPlayer
@onready var dialogue_panel = $"../../Dialogue/DialoguePanel"
@onready var transition = $"../Transition"

signal fade_out_ready()

func _ready():
	transition.hide()
# Called when the node enters the scene tree for the first time.
func play_fade_in():
	play("fade_in")

func _play_fade_out():
	print("fade")
	play("fade_out")
	emit_signal("fade_out_ready")
