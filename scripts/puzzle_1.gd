extends BaseScene

var objs = {
	"caixa": false,
	"cilindro_1": false,
	"cilindro_2": false
}

@onready var caixa = $shadow_rectangle
@onready var cilindro = $shadow_cilinder
@onready var cilindro_2 = $shadow_cilinder2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if global_state.completed_puzzle["puzzle1"]:
		return
	
	if (check_objs()):
		global_state.completed_puzzle["puzzle1"] = true
	
	caixa.connect("body_entered", Callable(self, "_on_caixa_body_entered"))
	cilindro.connect("body_entered", Callable(self, "_on_cilindro_body_entered"))
	cilindro_2.connect("body_entered", Callable(self, "_on_cilindro_2_body_entered"))
	
	pass
	

func _on_cilindro_body_entered(body):
	if body is RigidBody3D:
		print("Entrou no cilindro")
		if body.name == "Barrel":
			objs["cilindro_1"] = true
		if body.name == "Barrel1":
			objs["cilindro_2"] = true


func _on_cilindro_2_body_entered(body):
	if body is RigidBody3D:
		print("Entrou no cilindro")
		if body.name == "Barrel":
			objs["cilindro_1"] = true
		if body.name == "Barrel1":
			objs["cilindro_2"] = true


func _on_caixa_body_entered(body):
	if body is RigidBody3D:
		print("Entrou na caixa")
		if body.name == "Bags_1":
			objs["caixa"] = true

func check_objs():
	for key in objs:
		if !objs[key]:
			return false
	return true
