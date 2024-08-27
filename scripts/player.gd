
extends CharacterBody3D

var ORIGINAL_SPEED
var SPEED = 3.0
var sprint_draint_amount = 0.3
var sprint_refresh_amount = 0.4
var SPRINT_SPEED = 7.0
const JUMP_VELOCITY = 4.5
var sprint_slider
var movable = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	ORIGINAL_SPEED = SPEED
	sprint_slider = get_node("/root/" + get_tree().current_scene.name + "/UI/sprint_slider")

func _process(delta):
	if SPEED == SPRINT_SPEED:
		sprint_slider.value = sprint_slider.value - sprint_draint_amount * delta
		if sprint_slider.value == sprint_slider.min_value:
			SPEED = ORIGINAL_SPEED
	if SPEED != SPRINT_SPEED:
		if sprint_slider.value < sprint_slider.max_value:
			sprint_slider.value = sprint_slider.value + sprint_refresh_amount * delta
		if sprint_slider.value == sprint_slider.max_value:
			sprint_slider.visible = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if movable == true :
	# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY


	# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("left", "right", "forward", "backward")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			
			if Input.is_action_just_pressed("Sprint"):
				sprint_slider.visible = true
				SPEED = SPRINT_SPEED
			if Input.is_action_just_released("Sprint") :
				SPEED = ORIGINAL_SPEED
				
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
