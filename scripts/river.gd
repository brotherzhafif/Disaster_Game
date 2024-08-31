extends Area3D

@onready var timer = $Timer
var sas
## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if timer.is_stopped() and sas.contains("Character"):
		#pass#get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
#
#func _on_body_entered(body):
	#sas = str(body)
	#if sas.contains("Character"):
		#timer.start(5)
