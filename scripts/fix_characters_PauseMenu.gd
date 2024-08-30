extends Node3D



@onready var pauseMenu_forest = $PauseMenu_Forest


var paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		# Jika sudah dijeda, sembunyikan menu pause dan kembalikan waktu normal
		pauseMenu_forest.hide()
		Engine.time_scale = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Sembunyikan kursor saat tidak dijeda
	else:
		# Jika belum dijeda, tampilkan menu pause dan hentikan waktu
		pauseMenu_forest.show()
		Engine.time_scale = 0
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Tampilkan kursor saat dijeda
	
	# Toggle status pause
	paused = !paused
