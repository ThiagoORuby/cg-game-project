extends BaseScene

@onready var intro_animation: AnimationPlayer = $"IntroCutscene/IntroAnimation"
@onready var player_scene = preload("res://scenes/player.tscn")
@onready var player_initial_pos: Marker3D = $"EntranceMarkers/player_pos"

@onready var info_label: Label = $"UI/BottomInfo"
var next_car: bool = false

func _ready() -> void:
	super()
	
	if not global_state.has_played_intro_cutscene:
		intro_animation.play("intro")
		global_state.has_played_intro_cutscene = true
		global_state.first_time_running = false
	else:
		if global_state.first_time_running:
			set_player()
			global_state.first_time_running = false
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

func set_player():
	player = player_scene.instantiate()
	add_child(player)
	player.global_transform.origin = player_initial_pos.global_transform.origin
	
	var player_head = player.get_node("Head")
	player_head.get_child(0).current = true

func _on_intro_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "intro":
		set_player()

func all(values):
	for value in values:
		if not value:
			return false
	return true
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interaction"):
		if info_label.visible and next_car:
			if all(global_state.item_hash.values()):
				player.queue_free()
				$UI.queue_free()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				#$UI/CenterContainer.visible = false
				intro_animation.play("ending")
				print("DEU CERTO! JOGO FINALIZADO!!")


func _on_car_area_body_entered(body: Node3D) -> void:
	if body is Player:
		next_car = true
		info_label.text = "Pressione O para consertar"
		info_label.visible = true


func _on_car_area_body_exited(body: Node3D) -> void:
	if body is Player:
		next_car = false
		info_label.text = ""
		info_label.visible = false
