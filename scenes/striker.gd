#extends RigidBody2D
#
#var aiming = true
#
#func _physics_process(delta):
	## apply force on the striker when the shot
	#if Input.is_action_just_pressed("shoot"):
		#var mouse_position = get_viewport().get_mouse_position()
		#var direction = (mouse_position - position).normalized()
		## strength of the force is calculated like this for now
		#var strength = mouse_position.distance_to(position)
		#
		## reset the striker velocities before applying the force on it
		#linear_velocity = Vector2.ZERO
		#angular_velocity = 0.0
		#apply_central_impulse(direction * -(strength * 5))
		#aiming = false
	#
	## while in aiming mode, allow moving the striker left and right
	#if Input.is_action_pressed("left") and aiming:
		#position.x -= 5
		#if position.x < 168:
			#position.x = 168
	#if Input.is_action_pressed("right") and aiming:
		#position.x += 5
		#if position.x > 480:
			#position.x = 480
		#
#
#func _integrate_forces(state):
	#if Input.is_action_just_pressed("reset_striker"):
		#linear_velocity = Vector2.ZERO
		#angular_velocity = 0.0
		#position = $"../StrikerStartMarker".position # teleport the striker to the default marker position
		#
		#aiming = true
	#
	#
