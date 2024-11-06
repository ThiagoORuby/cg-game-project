class_name SceneManager extends Node

var player: Player
var last_scene_name: String
var current_scene_name: String

var scene_dir_path = "res://scenes/"

func change_scene(from, to: String) -> void:
	print("TO:")
	print(to)
	player = from.player
	current_scene_name = to
	last_scene_name = from.name
	if player and player.get_parent():
		player.drop_object()
		player.get_parent().remove_child(player)
	
	var full_path = scene_dir_path + to + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
