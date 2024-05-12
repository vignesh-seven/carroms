extends RigidBody2D

#@export var previous_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	#if previous_position == position:
		#print("not moving")
	#else:
		#print("moving")
	#if linear_velocity <= Vector2(2.0, 2.0) and linear_velocity >= Vector2(-2.0, -2.0):
		#print("stopped")
	#else:
		#print("moving")
	#is_zero_approx(linear_velocity)
	#print(position)
	
	#if Input.is_action_just_pressed("shoot"):
		#apply_central_impulse(Vector2(1000,-2000))
