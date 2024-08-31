extends Node3D

var location = [
	"Beach",
	"Beach",
	"Beach",
	"Beach"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.win == null:
		$CanvasLayer/judul.text = "Picking Location"
		$Timer.start(5)
	if Global.win == 0:
		$Timer.start(15)		
		$CanvasLayer/city.text = "You Lose"
		if Global.lokasi == "Beach":
			$CanvasLayer/judul.text = "Watch The Sea Water Decreased and Go To High Place"
	if Global.win == 1:
		$Timer.start(15)
		$CanvasLayer/city.text = "You Win"
		$CanvasLayer/judul.text = "Good Job Surviving The Disaster"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $Timer.time_left > 3 and $Timer.time_left <= 5:
		$CanvasLayer/judul.text = "Picking Location"
		Global.win = null
		Global.lokasi = location.pick_random()
	if $Timer.time_left < 1:
		$CanvasLayer/judul.text = "Teleporting To"
	if $Timer.is_stopped():
		get_tree().change_scene_to_file("res://scenes/"+ Global.lokasi +"/main.tscn")
	if $Timer.time_left <= 5:
		$CanvasLayer/city.text = Global.lokasi
		
