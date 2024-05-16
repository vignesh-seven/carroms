extends Node2D

signal reset_striker

var positions = false

var all_objects_stopped_moving = true

const STRIKER_STRENGH = 1000

var striker_scene = preload("res://scenes/striker.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	#print("hi from strigers.gd")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if Input.is_action_just_pressed("aim"):
		#print("Aiming")
	#if Input.is_action_just_released("aim"):
		#print("Released")

func _physics_process(delta):
	if Input.is_action_just_released("aim"):
		if $StrikerPhysics.get_child_count() == 0: # only spawn striker if there are no strikers already
			$StrikerDummy.visible = false
			var striker = striker_scene.instantiate()
			striker.position = $"../StrikerPositionMarker".position

			var mouse_position = get_viewport().get_mouse_position()
			var direction = (mouse_position - $"../StrikerPositionMarker".position).normalized()
			# strength of the force is calculated like this for now
			#var strength = mouse_position.distance_to(position)

			#print($StrikerDummy.get_child(2).get_child(0).value)
			#var strength = STRIKER_STRENGH * $StrikerDummy.get_child(2).get_child(0).value / 100
			var strength = STRIKER_STRENGH * $StrikerDummy/Control/HSlider.value / 100
			#print($StrikerDummy/Control/HSlider.value)

			# reset the striker velocities before applying the force on it
			#striker.linear_velocity = Vector2.ZERO
			#striker.angular_velocity = 0.0
			striker.apply_central_impulse(direction * -(strength * 3))

			$StrikerPhysics.add_child(striker)

	if Input.is_action_just_pressed("reset_striker"):

		# check if all the physics objects are stationary or not
			# check if all striker & carroms are stationary
		var carroms = $"../Carroms".get_children()
		# adding striker to the list
		carroms += $StrikerPhysics.get_children()
		for carrom in carroms:
			if carrom.get_class() == "RigidBody2D":
				if carrom.linear_velocity <= Vector2(2.0, 2.0) and carrom.linear_velocity >= Vector2(-2.0, -2.0):
					all_objects_stopped_moving = true
					continue
				else:
					all_objects_stopped_moving = false
					break
		if !all_objects_stopped_moving:
			print("Can't reset when the carroms are still moving")
			return
		# reset the striker
		var strikers = $StrikerPhysics.get_children(true)
		# we're gonna iterate through it, just incase there's multiple of them (there shouldn't be, but hey)
		for striker in strikers:
			#print("Striker velocity: %d, %d: " % striker.linear_velocity.x, striker.linear_velocity.y)
			striker.queue_free()
		#find_child("Striker")
		#print(find_children("Striker"))
		reset_striker.emit()
		print("Reset")

