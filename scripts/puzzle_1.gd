extends BaseScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_teste_cilindro_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		print(body.name)
	pass # Replace with function body.


func _on_teste_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		print(body.name)
	pass # Replace with function body.
