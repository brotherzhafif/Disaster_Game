extends Area3D

func _on_body_entered(body):
	var sas = str(body)
	if sas.contains("Character"):
		get_tree().change_scene_to_file("res://scenes/mainLobby.tscn")
		Global.win = 0
