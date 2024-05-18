extends Node2D

signal shoot

@export var ready_for_aiming: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	#print("hi from striker_dummy.gd")
	visible = true
	$AimCircleSprite.visible = false
	$Control.visible = false
	position = $"../../StrikerPositionMarker".position
	$AnimationPlayer.play("spawn_animation_part2")

func _process(delta):
	if Input.is_action_pressed("left"):
		if position.x > $"../StrikerBoundaryMarkers/Left".position.x:
			position.x -= 200 * delta
			$"../../StrikerPositionMarker".position = position

	if Input.is_action_pressed("right"):
		if position.x < $"../StrikerBoundaryMarkers/Right".position.x:
			position.x += 200 * delta
			$"../../StrikerPositionMarker".position = position

	if Input.is_action_pressed("aim"):
		# change angle based on mouse position
		var angle = $Control.position.angle_to_point(get_local_mouse_position())
		$Control.rotation = angle

		# change aim slider value based on mouse position
		var distance = global_position.distance_to(get_global_mouse_position())
		#distance *= 2  # the measurements don't match for "distance" and "aimcircle width" for some reason, this is a temporary fix
		var aim_circle_radius = $AimCircleSprite.texture.get_width() * $AimCircleSprite.scale.x * 0.5
		var value = (distance / aim_circle_radius) * 100
		if value > 100: value = 100 # make sure the slider value isnt over 100%
		$Control/HSlider.value = value
		$Control/AimLine.value = value

	if Input.is_action_just_pressed("aim"):
		$AimCircleSprite.visible = true
		$Control.visible = true

	if Input.is_action_just_released("aim"):
		$AimCircleSprite.visible = false
		$Control.visible = false


func _on_strikers_reset_striker(prev_position):
	visible = true
	print(prev_position)
	print($"../../StrikerPositionMarker".position)
	position = prev_position
	$AnimationPlayer.play("spawn_animation_part1")

func trigget_spawn_animation_part2():
	position = $"../../StrikerPositionMarker".position
	$AnimationPlayer.play("spawn_animation_part2")


