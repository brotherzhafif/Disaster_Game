extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
func spawn():
	var spawned_scene = load("res://scenes/Forest/Flametscn.tscn")
	var spawned_scene_copy = spawned_scene.instance()
	spawned_scene_copy.translation.x = randi() % 5
	add_child(spawned_scene_copy)
	

func _process(delta):
	pass
	if Input.is_action_just_pressed("spawn_flame"):
		spawn()
