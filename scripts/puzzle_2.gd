extends BaseScene

func check_plates ():
	for key in global_state.plate_status:
		if not global_state.plate_status[key]:
			return false
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(check_plates()):
		global_state.completed_puzzle["puzzle2"] = true
	pass
