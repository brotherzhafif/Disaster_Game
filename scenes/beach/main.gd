extends Node3D

@onready var timer = $Timer
@onready var tsunami_wave = $tsunami_wave
@onready var river = $river
var waktu = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	tsunami_wave.position = Vector3(0,-45,-305)
	river.position.y = 2
	tsunami_wave.hide()
	timer.start(waktu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# airnya mulai surut
	river.position.y = river.position.y - 0.001
	if river.position.y < -1:
		river.position.y = -1
	# Ketika Ombak Gede Keluar
	if timer.is_stopped():
		tsunami_wave.show()
		tsunami_wave.position.z = tsunami_wave.position.z + 0.35
		if tsunami_wave.position.y < -7.6:
			tsunami_wave.position.y = tsunami_wave.position.y + 0.05
		if tsunami_wave.position.z > 50:
			tsunami_wave.position.y = tsunami_wave.position.y - 0.1
		if tsunami_wave.position.z > 400:
			tsunami_wave.hide()
			Global.win = 1
			get_tree().change_scene_to_file("res://scenes/mainLobby.tscn")
		
