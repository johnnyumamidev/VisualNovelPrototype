extends Node
class_name GameManager

func handle_game(tree: SceneTree):
	if Input.is_action_just_pressed("exit"):
		tree.quit()

