extends CharacterBody3D


@export var acceleration = 5
@export var friction = 0.75
@export var topSpeed = 10
@export var JUMP_VELOCITY = 4.0

@export var mouseSensX = .25
@export var mouseSensY = .15

@onready var jumpStr = JUMP_VELOCITY
@onready var cam = $Camera3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#Handle mouse movement
func _unhandled_input(event):
	if(event is InputEventMouseMotion):
		rotate_y(deg_to_rad(event.relative.x * -mouseSensX))
		cam.rotate_x(deg_to_rad(event.relative.y * - mouseSensY))
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _ready():
	#Get mouse to be locked to screen
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jumps depending on how long space is held
	if Input.is_action_pressed("jump") and is_on_floor():
		jumpStr += .1
		jumpStr = clamp(jumpStr, 0, 4)
	if(Input.is_action_just_released("jump") and is_on_floor()):
		velocity.y = jumpStr
		jumpStr = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		#Apply acceleration
		velocity.x = direction.x * acceleration
		velocity.z = direction.z * acceleration
	else:
		#Apply friction
		velocity.x = move_toward(velocity.x, 0, friction)
		velocity.z = move_toward(velocity.z, 0, friction)
		
	#Limit speed
	velocity.x = clamp(velocity.x, -topSpeed, topSpeed)
	velocity.z = clamp(velocity.z, -topSpeed, topSpeed)

	move_and_slide()
