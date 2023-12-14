#Credit to https://www.youtube.com/watch?v=JEQR4ALlwVU
extends CanvasLayer

@onready var sceneManager = get_tree().get_root().get_node("SceneManager")

func _on_start_pressed():
	sceneManager.loadLevel("world")

func _on_credits_pressed():
	print("Credits")

func _on_exit_pressed():
	get_tree().quit()
