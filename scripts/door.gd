extends Area3D

@export var internal_scene_path: String
@onready var info_label: Label =  $"../../UI/BottomInfo"
@onready var transition: ColorRect = $"../../SceneTransitionRect"
@onready var sound: AudioStreamPlayer3D = $"AudioStreamPlayer3D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("door_open"):
		if info_label.visible:
			transition.play_transition()
			sound.play()
			await get_tree().create_timer(0.6).timeout
			scene_manager.change_scene(get_owner(), internal_scene_path)
		


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		print(internal_scene_path)
		info_label.text = "Pressione L para entrar"
		info_label.visible = true


func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		info_label.visible = false
