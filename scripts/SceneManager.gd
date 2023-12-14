extends Node3D

@onready var world = preload("res://scenes/world.tscn")
@onready var menu = preload("res://scenes/menu.tscn")
@export var highScore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	loadLevel("menu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func setHighScore(newScore):
	if(newScore > highScore):
		highScore = newScore
	
func loadLevel(levelName):

	# If no level exists, don't try to delete the current level
	if get_child_count() > 0:
		get_child(0).queue_free()

	# Create level, set its name (for future reference), then add it to the sceneManager node
	# Use call deferred to do it in next idle frame. It does something with avoiding conflict in the main thread
	match levelName:
		"menu":
			call_deferred("add_child", menu.instantiate())
		"world":
			call_deferred("add_child", world.instantiate())
		"credits":
			pass
			#call_deferred("add_child", credits.instantiate())
	

