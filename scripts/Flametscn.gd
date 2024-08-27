extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Fungsi untuk mem-spawn objek
func spawn():
	var spawned_scene = load("res://nyobaspawn.tscn")
	if spawned_scene:
		var spawned_scene_copy = spawned_scene.instantiate()
		
		# Mengatur posisi acak dengan Vector3
		spawned_scene_copy.translation = Vector3(
			randi() % 5,  # Random X
			0,           # Y posisi tetap
			randi() % 5   # Random Z
		)
		
		add_child(spawned_scene_copy)
	else:
		print("Error: Scene not found at path: res://nyobaspawn.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("spawn_flame"):
		spawn()
