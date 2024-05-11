extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left"):
		print("hi")
		var striker_dummy = striker_dummy_scene.instantiate()
		#striker_dummy.position = $"../StrikerStartMarker".position
		print(striker_dummy.position)
	
		add_child(striker_dummy)
