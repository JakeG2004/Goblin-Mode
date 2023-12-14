extends Node3D

@onready var music_player = %musicPlayer
@onready var sceneManager = get_tree().get_root().get_node("SceneManager")
@onready var cat = get_tree().get_root().get_node("SceneManager/world/CharacterBody3D/neck/cat")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!music_player.playing):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		sceneManager.setHighScore(cat.points)
		sceneManager.loadLevel("menu")


