extends Label
@onready var cat = $"../../../neck/cat"

var score = 0
# Called when the node enters the scene tree for the first time.
func _process(_delta):
	score = cat.points
	text = "Score: %s" % score
