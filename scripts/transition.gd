extends ColorRect

@onready var anim_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.color.a = 255
	anim_player.play_backwards("Fade")

func play_transition() -> void:
	anim_player.play("Fade")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
