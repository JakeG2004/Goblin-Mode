#Credit to https://www.youtube.com/watch?v=JEQR4ALlwVU
extends CanvasLayer

@export var paused = false
@onready var sceneManager = get_tree().get_root().get_node("SceneManager")
@onready var musicPlayer = get_tree().get_root().get_node("SceneManager/world/musicPlayer")
@onready var cat = $"../../../neck/cat"

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		pause_menu()
		
func pause_menu():
	if paused:
		hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().paused = false
	else:
		show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		
	paused = !paused
	
func _on_resume_pressed():
	pause_menu()

func _on_restart_pressed():
	pause_menu()
	sceneManager.setHighScore(cat.points)
	get_tree().reload_current_scene()

func _on_menu_pressed():
	pause_menu()
	sceneManager.setHighScore(cat.points)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	sceneManager.loadLevel("menu")
