extends RigidBody2D

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		var mouse_position = get_viewport().get_mouse_position()
		#print(get_viewport().get_mouse_position())
		var direction = (mouse_position - position).normalized() 
		var strength = mouse_position.distance_to(position)
		apply_central_impulse(direction * -(strength * 5))
		#print(strength)
		
func _integrate_forces(state):
	if Input.is_action_just_pressed("start_striker"):
		print("Start striker")
		#freeze = true
		linear_velocity = Vector2.ZERO
		position = $"../StrikerStartMarker".position
		#freeze = false
