class_name UIInventary extends VBoxContainer

var item_icons = {
	"car_key": preload("res://car_key.png"),
	"steering_wheel": preload("res://steering_wheel.png"),
	"gas": preload("res://gasoline.png"),
	"gate_key": preload("res://gate_key.png")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_state.connect("item_collected", _on_item_collected)
	
	for item_name in global_state.item_hash.keys():
		if global_state.item_hash[item_name]:
			add_item_to_inventory(item_name)

func add_item_to_inventory(item_name: String):
	var icon_texture = item_icons.get(item_name, null)
	if icon_texture:
		var slot = PanelContainer.new()
		slot.set("bg_color", Color(0.5, 0.5, 0.5, 0.8))

		var icon = TextureRect.new()
		icon.texture = icon_texture
		#icon.set_size(Vector2(32,32))
		icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		slot.add_child(icon)
		add_child(slot)

func _on_item_collected(item_name):
	add_item_to_inventory(item_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
