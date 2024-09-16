extends MeshInstance3D

@onready var blades = $blades
@export var rotation_speed : float = 180.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	blades.rotate_z((deg_to_rad(rotation_speed * delta)))
