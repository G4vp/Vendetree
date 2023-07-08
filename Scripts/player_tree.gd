extends CharacterBody3D

@onready var node_mesh = $mesh_tree_3d
@onready var animation_player = $mesh_tree_3d/AnimationPlayer

const SPEED = 125
const JUMP_VELOCITY = 7

var sens_x = 0.08
var sens_y = 0.08

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# Add the gravity.
	player_movement(delta)

func _input(event):
	player_camera(event)

func player_movement(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	var input_dir = Vector3.ZERO
	if Input.is_action_just_pressed("key_jump") and is_on_floor() and !animation_player.is_playing():
		animation_player.play("ArmatureAction_001")
		velocity.y = JUMP_VELOCITY
		input_dir.x = transform.basis.x.x * transform.basis.x.z
		input_dir.z = -1
		print(transform.basis)
	# Get the input direction and handle the movement/deceleration.
	var direction = (transform.basis * input_dir).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)		
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	
func player_camera(input):
	if input is InputEventMouseMotion && !Input.is_action_pressed("left_click"):
		rotate_y(deg_to_rad(-input.relative.x * sens_x))
