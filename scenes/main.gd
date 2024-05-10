extends Node2D

# Spawning the carroms happens here

var black_carrom_scene = preload("res://scenes/black_carrom.tscn")
var yellow_carrom_scene = preload("res://scenes/yellow_carrom.tscn")
var red_carrom_scene = preload("res://scenes/red_carrom.tscn")

func _ready():
# the markers that contain all the postitions for the carroms (along with the color)
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
