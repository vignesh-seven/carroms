extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("shoot"):
		var mouse_position = get_viewport().get_mouse_position()
		print(get_viewport().get_mouse_position())
		#direction, magnitude
		# direction: mouse position
		# magnitude: constant (for now)
		var direction = (mouse_position - position).normalized() 
		apply_central_impulse(direction * -500)
