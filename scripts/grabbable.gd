extends RigidBody3D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	# Reseta a posição do objeto ao cair fora do mapa
	if(global_position.y < -5):
		global_position.y = 5
