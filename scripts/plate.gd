extends Area3D

@onready var animation : AnimationPlayer = $"/root/Puzzle2/Plates/AnimationPlayer"
var objects = {}

func sum (objects: Dictionary):
	var total = 0
	for key in objects:
		total += objects[key].mass
	return total

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if sum(objects) >= global_state.plate_max_mass[get_parent().name]:
		if not global_state.plate_status[get_parent().name]:
			global_state.plate_status[get_parent().name] = true
			animation.play("down_" + get_parent().name)
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		objects[body.name] = body 
	pass # Replace with function body.


func _on_body_exited(body: Node3D) -> void:
	if body is RigidBody3D:
		if objects.has(body.name):
			objects.erase(body.name)
	pass # Replace with function body.
