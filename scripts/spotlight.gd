class_name Spotlight extends StaticBody3D

@export var spotlight_name = ""
@onready var light = $light
@onready var spotlight = $spotlight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global_state.completed_puzzle["puzzle4"]:
		global_state.spotlight_map[spotlight_name] = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_state.spotlight_map.get(spotlight_name) == true:
		light.visible = true
		spotlight.visible = true
	else:
		light.visible = false
		spotlight.visible = false

	
