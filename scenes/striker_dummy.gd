extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	position = $"../../StrikerPositionMarker".position

func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= 5
		$"../../StrikerPositionMarker".position = position
		
	if Input.is_action_pressed("right"):
		position.x += 5
		$"../../StrikerPositionMarker".position = position
		
		
func _on_main_reset_striker():
	visible = true
	position = $"../../StrikerPositionMarker".position
	
