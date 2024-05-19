extends Node2D

#signal reset_striker
# Spawning the carroms happens here
var black_carrom_scene = preload("res://scenes/black_carrom.tscn")
var yellow_carrom_scene = preload("res://scenes/yellow_carrom.tscn")
var red_carrom_scene = preload("res://scenes/red_carrom.tscn")

# Spawning the strikers
var striker_scene = preload("res://scenes/striker.tscn")
#var striker_dummy_scene = preload("res://scenes/striker_dummy.tscn")

var total_score = 0

func _ready():
	#print("hi from main.gd")
	# the markers that contain all the postitions for the carroms (along with the color)
	# spawning carroms
	if !$Carroms/Markers.visible: return
	var markers = $Carroms/Markers.get_children()
	for marker in markers:
		#print(marker.position)
		#print(marker.get_meta("color"))
		if marker.get_meta("color") == "red" and marker.visible:
			var carrom = red_carrom_scene.instantiate()
			carrom.position = marker.position
			$Carroms.add_child(carrom)
		if marker.get_meta("color") == "black" and marker.visible:
			var carrom = black_carrom_scene.instantiate()
			carrom.position = marker.position
			$Carroms.add_child(carrom)
		if marker.get_meta("color") == "yellow" and marker.visible:
			var carrom = yellow_carrom_scene.instantiate()
			carrom.position = marker.position
			$Carroms.add_child(carrom)

	# set-up the striker sprite
	#$Strikers/StrikerDummy.position = $StrikerPositionMarker.position

func _process(delta):
	pass
	#if Input.is_action_just_pressed("shoot"):
		#print("Shoot")
		#var striker = striker_scene.instantiate()
		#striker.linear_velocity = Vector2.ZERO
		#striker.angular_velocity = 0.0
		#striker.position = $"../StrikerPositionMarker".position
		#$Strikers.add_child(striker)







func _on_goal_points_delete_carrom(carrom):
	#print(carrom.linear_velocity)
	carrom.queue_free()


func _on_goal_points_scored(score):
	total_score += score
	$CanvasLayer/Control/GridContainer/Score.text = str(total_score)
