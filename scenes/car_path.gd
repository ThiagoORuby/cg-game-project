extends PathFollow3D

@export var max_speed: float = 3.0
@export var acceleration: float = 0.02
@export var play_path: bool = false

var current_speed: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play_path:
		current_speed = min(current_speed + acceleration * delta, max_speed)
		progress += current_speed
		
