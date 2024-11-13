class_name SpotlightButton extends StaticBody3D

@export var button_code = ""
@onready var animation_player = $AnimationPlayer
@onready var light_button = $light_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_button.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
