extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 5.5
const SENSITIVITY = 0.005

@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var raycast = $Head/Camera3D/RayCast3D
@onready var holdPos = $Head/Camera3D/HoldPos

var grabbed_object: RigidBody3D = null
var box_collision: CollisionShape3D = null
var original_distance: float
var outline_shader_material = null

func _ready():
	# captura mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Muda rotação da cabeça/cwamera com base no movimento do mouse
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(80))

func _physics_process(delta: float) -> void:
	# Adiciona gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Fecha o jogo
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	# Executa pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Agarra um objeto
	if Input.is_action_just_pressed("grab"):
		if grabbed_object:
			drop_object()
		else:
			grab_object()
	
	# Fixa o objeto capturado na tela e aplica transformações
	if grabbed_object:
		grabbed_object.global_position = holdPos.global_position
		apply_transformations()

	# Pega a direção do movimento e executa a translação
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
func grab_object():
	if raycast.is_colliding():
		var target = raycast.get_collider()
		if target is RigidBody3D:
			grabbed_object = target
			box_collision = grabbed_object.get_node("CollisionShape3D")
			box_collision.get_child(0).apply_outline()
			grabbed_object.freeze = true
			original_distance = camera.global_transform.origin.distance_to(
				grabbed_object.global_transform.origin
				)
			grabbed_object.collision_mask = 0
			grabbed_object.collision_layer = 0

func drop_object():
	if grabbed_object:
		grabbed_object.collision_mask = 1
		grabbed_object.set_collision_layer_value(0, false)
		grabbed_object.set_collision_layer_value(1,true)
		grabbed_object.set_collision_layer_value(2,true)
		box_collision.get_child(0).remove_outline()
		grabbed_object.freeze = false
		grabbed_object = null
		box_collision = null
		
func apply_transformations():
	if Input.is_action_pressed("increase"):
		box_collision.scale *= 1.05
	
	if Input.is_action_pressed("decrease"):
		box_collision.scale /= 1.05
	
	box_collision.scale = clamp(box_collision.scale, 
				Vector3(0.5, 0.5, 0.5), 
				Vector3(10, 10, 10))
				
	if Input.is_action_pressed("clockwise"):
		grabbed_object.rotate_x(-0.05)
	if Input.is_action_pressed("anticlockwise"):
		grabbed_object.rotate_x(0.05)
