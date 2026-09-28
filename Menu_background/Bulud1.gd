extends Sprite


const velocity :float = -1.0

var g_texture_width :float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	g_texture_width = texture.get_size().x  * scale.x

func _process(_delta :float) -> void:
	position.x += velocity
	_texture_hereket()
	
func _texture_hereket() -> void:
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
