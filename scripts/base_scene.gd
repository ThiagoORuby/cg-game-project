class_name BaseScene extends Node

@onready var player: Player = $Player
@onready var entrance_markers: Node3D = $EntranceMarkers


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if scene_manager.player:
		if player:
			player.queue_free()
			
		player = scene_manager.player
		add_child(player)
		position_player()
	

func position_player() -> void:
	var last_scene = scene_manager.last_scene_name.to_lower()
	
	if last_scene.is_empty():
		last_scene = "any"
	
	for entrance in entrance_markers.get_children():
		var entrance_name = entrance.name.to_lower()
		
		if entrance is Marker3D and entrance_name == "any" or entrance_name == last_scene:
			player.global_transform.origin = entrance.global_transform.origin
