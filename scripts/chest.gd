class_name Chest extends Area3D

@onready var info_label: Label =  $"../../UI/BottomInfo"
@onready var open_animation: AnimationPlayer = $"../AnimationPlayer"

var current_body = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interaction"):
		var current_scene = scene_manager.current_scene_name
		var is_completed = global_state.completed_puzzle[current_scene]
		if info_label.visible and current_body:
			if is_completed:
				var itens = get_tree().get_nodes_in_group("itens")
				if itens:
					itens[0].set_collision_layer_value(2,true)
				open_animation.play("abertura")
			else:
				info_label.text = "Conclua o puzzle para abrir"
				


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		current_body = body
		info_label.text = "Pressione O para abrir"
		info_label.visible = true

func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		current_body = null
		info_label.text = ""
		info_label.visible = false
