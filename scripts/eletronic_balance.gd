extends Area3D

var target_y_position : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var platform : StaticBody3D = get_node("/root/Puzzle3/" + global_state.eletronic_balance_association_with_platforms[get_parent().name])
	platform.position.y = lerp(platform.position.y, target_y_position, 0.1)
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		var platform : StaticBody3D = get_node("/root/Puzzle3/" + global_state.eletronic_balance_association_with_platforms[get_parent().name])
	
		target_y_position = clamp(platform.position.y + round(body.mass * 0.2), 0.1, 5)

	pass # Replace with function body.


func _on_body_exited(body: Node3D) -> void:
	if body is RigidBody3D:
		var platform : StaticBody3D = get_node("/root/Puzzle3/" + global_state.eletronic_balance_association_with_platforms[get_parent().name])
		
		target_y_position = clamp(platform.position.y - round(body.mass * 0.2), 0.1, 5)
	pass # Replace with function body.
