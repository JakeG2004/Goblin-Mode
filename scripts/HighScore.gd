extends Button

@onready var sceneManager = get_tree().get_root().get_node("SceneManager")

var score = 0
# Called when the node enters the scene tree for the first time.
func _process(_delta):
	score = sceneManager.highScore
	text = "High Score: %s" % score
