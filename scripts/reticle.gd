extends CenterContainer

@export var DOT_RADIUS: float = 2.0
@export var DOT_COLOR: Color = Color.WHITE
	
func _draw() -> void:
	# Desenha ponto de mira na tela
	draw_circle(Vector2(0,0), DOT_RADIUS, DOT_COLOR)
