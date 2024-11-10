extends Area3D
@onready var colision: CollisionShape3D = $CollisionShape3D
var inside: bool = false
var entered_body = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inside:
		verification(entered_body)
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		inside = true
		entered_body = body

func _on_body_exited(body: Node3D) -> void:
	if body is RigidBody3D:
		inside = false
		entered_body = null

func verification (body: RigidBody3D) -> void:
	var shape = colision.shape
	var body_shape = body.get_node("CollisionShape3D").shape
	if shape is BoxShape3D:
		if body_shape is BoxShape3D:
			print(name)
			print((body_shape.extents.x * 2)/(shape.extents.x * 2) * 100)
		else:
			pass
	elif shape is CylinderShape3D:
		if body_shape is CylinderShape3D:
			print(name)
			print((body_shape.radius * 2)/(shape.radius * 2) * 100)
		else:
			pass
	pass
