extends MeshInstance3D

@onready var blades = $blades
@export var rotation_speed : float = 200.0


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Rotaciona hélices da ventilação
	blades.rotate_z((deg_to_rad(rotation_speed * delta)))
