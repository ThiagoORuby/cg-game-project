extends BaseScene

@onready var item = $car_key

func _ready() -> void:
	super()
	if global_state.completed_puzzle["puzzle3"]:
		item.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_2_body_entered(body: Node3D) -> void:
	pass # Replace with function body.
