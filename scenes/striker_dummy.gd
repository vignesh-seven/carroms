extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("hi from striker_dummy.gd")
	visible = true
	position = $"../../StrikerPositionMarker".position

func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= 200 * delta
		$"../../StrikerPositionMarker".position = position
		
	if Input.is_action_pressed("right"):
		position.x += 200 * delta
		$"../../StrikerPositionMarker".position = position
		
		
func _on_strikers_reset_striker():
	visible = true
	position = $"../../StrikerPositionMarker".position

