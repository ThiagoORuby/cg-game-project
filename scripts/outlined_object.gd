extends MeshInstance3D

var base_material : ShaderMaterial
var current_material : ShaderMaterial

func _ready():
	# Carregar o material base
	var base = preload("res://shaders/outline.gdshader")
	base_material = ShaderMaterial.new()
	base_material.shader = base

	# Criar e aplicar o material original
	current_material = base_material.duplicate()
	#get_active_material(0).next_pass = current_material

func apply_outline():
	# Certifique-se de que o material é uma cópia independente
	get_active_material(0).next_pass = current_material

func remove_outline():
	# Reverter para o material sem contorno, se necessário
	get_active_material(0).next_pass = null
