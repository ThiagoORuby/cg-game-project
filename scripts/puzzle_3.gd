extends BaseScene

@onready var item = $car_key
@onready var ui_anim = $UI/AnimationPlayer

func _ready() -> void:
	super()
	if global_state.completed_puzzle["puzzle3"]:
		item.visible = false
	else:
		ui_anim.play("puzzle3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_2_body_entered(body: Node3D) -> void:
	pass # Replace with function body.
