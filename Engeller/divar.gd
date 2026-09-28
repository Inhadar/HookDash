extends StaticBody2D



var tikan_dir = RandomNumberGenerator.new()
var rotation_dir = 0
var rotation_speed = 15
var random_size = RandomNumberGenerator.new()
onready var Player = get_tree().current_scene.get_node("Player")
	
func _ready():
	random_size.randomize()
	var random_size_deyer = random_size.randi()%7 +5
	self.scale = Vector2(random_size_deyer,random_size_deyer)
	
	
	$AnimationPlayer.play("aura")
	randomize()
	var tik_rota = [-1,1]
	rotation_dir = tik_rota[randi() % tik_rota.size()]
	
	
	tikan_dir.randomize()
	
	var _tikan_set = tikan_dir.randi()%4
	
	
	"""
	#print(tikan_set)
	if tikan_set == 0:
		$Tikan_set.show()
		$Tikan_set/Tikan/CollisionShape2D.set_deferred("disabled",false)
		$Tikan_set/Tikan2/CollisionShape2D.set_deferred("disabled",false)
	elif tikan_set == 1:
		$Tikan_set2.show()
		$Tikan_set2/Tikan/CollisionShape2D.set_deferred("disabled",false)
		$Tikan_set2/Tikan2/CollisionShape2D.set_deferred("disabled",false)
	elif tikan_set == 2:
		$Tikan_set3.show()
		$Tikan_set3/Tikan/CollisionShape2D.set_deferred("disabled",false)
		$Tikan_set3/Tikan2/CollisionShape2D.set_deferred("disabled",false)
	elif tikan_set == 3:
		$Tikan_set4.show()
		$Tikan_set4/Tikan/CollisionShape2D.set_deferred("disabled",false)
		$Tikan_set4/Tikan2/CollisionShape2D.set_deferred("disabled",false)
	"""


func _physics_process(delta):
	
	if global_position.distance_to(Player.global_position) > 2000 and Player.global_position.x > global_position.x:
		#print("normal silindim")
		queue_free()
		Globals.spawn_miqdari -= 1

	
	rotation_degrees += rotation_dir * rotation_speed * delta

