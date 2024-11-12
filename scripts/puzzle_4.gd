extends BaseScene

@onready var ui_anim = $UI/AnimationPlayer
@onready var item = $gate_key

func _ready() -> void:
	super()
	if global_state.completed_puzzle["puzzle4"]:
		item.visible = false
	else:
		ui_anim.play("puzzle4")

func check_lights():
	for key in global_state.spotlight_map:
		if not global_state.spotlight_map[key]:
			return false
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if check_lights():
		global_state.completed_puzzle["puzzle4"] = true
