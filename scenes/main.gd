extends Node2D

# Spawning the carroms happens here
var black_carrom_scene = preload("res://scenes/black_carrom.tscn")
var yellow_carrom_scene = preload("res://scenes/yellow_carrom.tscn")
var red_carrom_scene = preload("res://scenes/red_carrom.tscn")

# Spawning the strikers
var striker_scene = preload("res://scenes/striker.tscn")
var striker_dummy_scene = preload("res://scenes/striker_dummy.tscn")


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
			
	# spawing striker
	var striker_dummy = striker_dummy_scene.instantiate()
	striker_dummy.position = $StrikerStartMarker.position
	print(striker_dummy.position)
	$Strikers.add_child(striker_dummy)
