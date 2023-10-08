extends AnimationPlayer

signal fade_out_start()

func _ready():
	pass
# Called when the node enters the scene tree for the first time.
func play_fade_in():
	play("fade_in")

func _play_fade_out():
	play("fade_out")
	emit_signal("fade_out_start")
