class_name GlobalState extends Node

var has_played_intro_cutscene = true
var first_time_running = true
var plate_max_mass = {
	"Plate1" : 15,
	"Plate2" : 25,
	"Plate3" : 20
}
var plate_status = {
	"Plate1" : false,
	"Plate2" : false,
	"Plate3" : false
}

var eletronic_balance_association_with_platforms = {
	"eletronic_balance1" : "Plataform1",
	"eletronic_balance2" : "Plataform2",
	"eletronic_balance3" : "Plataform3"
}


var scene_states = {}
var item_hash = {
	"car_key": true,
	"steering_wheel": true,
	"gas": true,
	"gate_key": true
}

var ordered_itens = []

var completed_puzzle = {
	"puzzle1": false,
	"puzzle2": false,
	"puzzle3": false,
	"puzzle4": false
}

# Sinal emitido ao coletar um item
signal item_collected(item_name)

# Coleta o item e emite um sinal
func collect_item(item_name: String):
	if item_hash.has(item_name):
		item_hash[item_name] = true
		ordered_itens.append(item_name)
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
