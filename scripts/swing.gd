extends Node3D

@onready var origin = get_tree().get_root().get_node("SceneManager/world/CharacterBody3D/origin")
@onready var ap = $AnimationPlayer

@export var points = 0

var other = null
var dist

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	dist = 10 * global_position.distance_to(origin.position)

	if(Input.is_action_just_pressed("leftPaw")):
		ap.play("swing")
		if(other != null):
			other.destroy()
			points += int(100 + dist)
			other = null
		
func _on_area_3d_body_entered(body):
	if(body.is_in_group("breakable")):
		other = body.get_node("Destruction")
		
func _on_area_3d_body_exited(_body):
	other = null
