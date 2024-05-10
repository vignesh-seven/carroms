extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	#if Input.is_action_just_pressed("shoot"):
		#apply_central_impulse(Vector2(1000,-2000))


