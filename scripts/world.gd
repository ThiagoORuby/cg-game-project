extends BaseScene


func _ready() -> void:
	super()
	var state_data = global_state.load_scene_state(get_name())
	if state_data:
		# Restaura o estado dos objetos
		for obj in get_tree().get_nodes_in_group("saveable_objects"):
			if state_data.has(obj.name):
				var obj_state = state_data[obj.name]
				obj.global_transform.origin = obj_state["position"]
				obj.get_child(0).rotation_degrees = obj_state["rotation"]
				obj.get_child(0).scale = obj_state["scale"]
	

func save_current_scene():
	var state_data = {}
	for obj in get_tree().get_nodes_in_group("saveable_objects"):
		state_data[obj.name] = {
			"position": obj.global_transform.origin,
			"rotation": obj.get_child(0).rotation_degrees,
			"scale": obj.get_child(0).scale,
		}
		
		global_state.save_scene_state(get_name(), state_data)
