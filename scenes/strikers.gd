extends Node2D

var striker_scene = preload("res://scenes/striker.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		$StrikerDummy.visible = false
		var striker = striker_scene.instantiate()
		striker.position = $"../StrikerPositionMarker".position
		
		var mouse_position = get_viewport().get_mouse_position()
		var direction = (mouse_position - $"../StrikerPositionMarker".position).normalized() 
		# strength of the force is calculated like this for now
		var strength = mouse_position.distance_to(position)
		
		# reset the striker velocities before applying the force on it
		#striker.linear_velocity = Vector2.ZERO
		#striker.angular_velocity = 0.0
		striker.apply_central_impulse(direction * -(strength * 3))
		
		$StrikerPhysics.add_child(striker)
		
