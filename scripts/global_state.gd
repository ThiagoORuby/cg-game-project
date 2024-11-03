class_name GlobalState extends Node

var scene_states = {}
var item_hash = {
	"car_key": false,
	"gas": false,
	"wheel": false,
	"gate_key": false
}

# Sinal emitido ao coletar um item
signal item_collected(item_name)

# Coleta o item e emite um sinal
func collect_item(item_name: String):
	if item_hash.has(item_name):
		item_hash[item_name] = true
		emit_signal("item_collected", item_name)


# Função para salvar o estado de uma cena
func save_scene_state(scene_name, state_data):
	scene_states[scene_name] = state_data

# Função para carregar o estado de uma cena
func load_scene_state(scene_name):
	return scene_states.get(scene_name, null)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
