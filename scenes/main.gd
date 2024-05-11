extends Node2D

signal reset_striker
# Spawning the carroms happens here
var black_carrom_scene = preload("res://scenes/black_carrom.tscn")
var yellow_carrom_scene = preload("res://scenes/yellow_carrom.tscn")
var red_carrom_scene = preload("res://scenes/red_carrom.tscn")

# Spawning the strikers
var striker_scene = preload("res://scenes/striker.tscn")
#var striker_dummy_scene = preload("res://scenes/striker_dummy.tscn")


func _ready():
	# the markers that contain all the postitions for the carroms (along with the color)
	# spawning carroms
	var markers = $Carroms/Markers.get_children()
	for marker in markers:
		#print(marker.position)
		#print(marker.get_meta("color"))
		if marker.get_meta("color") == "red":
			var carrom = red_carrom_scene.instantiate()
			carrom.position = marker.position
			$Carroms.add_child(carrom)
		if marker.get_meta("color") == "black":
			var carrom = black_carrom_scene.instantiate()
			carrom.position = marker.position
			$Carroms.add_child(carrom)
		if marker.get_meta("color") == "yellow":
			var carrom = yellow_carrom_scene.instantiate()
			carrom.position = marker.position
			$Carroms.add_child(carrom)
			
	# set-up the striker sprite
	#$Strikers/StrikerDummy.position = $StrikerPositionMarker.position
	
func _process(delta):
	#if Input.is_action_just_pressed("shoot"):
		#print("Shoot")
		#var striker = striker_scene.instantiate()
		#striker.linear_velocity = Vector2.ZERO
		#striker.angular_velocity = 0.0
		#striker.position = $"../StrikerPositionMarker".position
		#$Strikers.add_child(striker)
		
	if Input.is_action_just_pressed("reset_striker"):
		print("Reset")
		var strikers = $Strikers/StrikerPhysics.get_children(true)
		# we're gonna iterate through it, just incase there's multiple of them (there shouldn't be, but hey)
		for striker in strikers:
			striker.queue_free() 
		#find_child("Striker")
		#print(find_children("Striker"))
		reset_striker.emit()

	

