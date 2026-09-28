extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var size
var zerer_teref 
var y_quvvesi :float
var donme_deyer_set = [-1,1]
var donme_deyer
var engel_spd 
var donme_spd 
#onready var player = get_tree().current_scene.get_node("Player")
onready var Player = get_tree().current_scene.get_node("Player")

func _ready():
	#self.hide()
	randomize()
	#var direction_set = [1,2,3]
	#var direction_number = direction_set[randi() % direction_set.size()]
	engel_spd = rand_range(50,150)
	size = rand_range(0.7,1.5)
	donme_spd = rand_range(25,50)
	donme_deyer = donme_deyer_set[randi() % donme_deyer_set.size()]
	y_quvvesi = rand_range(100,150)
	$CollisionPolygon2D.scale = Vector2(size,size)
	$Node2D.scale = Vector2(size,size)
	#$Node2D/AnimationPlayer.play("efect")
	
	"""
	if direction_number == 1:
		$Node2D2/Area2D.show()
		$Node2D2/Area2D/CollisionPolygon2D2.set_deferred("disabled",false)
		$Node2D2/Area2D/AnimationPlayer.play("danger")
	elif direction_number == 2:
		$Node2D2/Area2D2.show()
		$Node2D2/Area2D2/CollisionPolygon2D2.set_deferred("disabled",false)
		$Node2D2/Area2D2/AnimationPlayer.play("danger")
	elif direction_number == 3:
		$Node2D2/Area2D3.show()
		$Node2D2/Area2D3/CollisionPolygon2D2.set_deferred("disabled",false)
		$Node2D2/Area2D3/AnimationPlayer2.play("danger")
	"""

# Called when the node enters the scene tree for the first time.


func _physics_process(delta):
	
	if global_position.distance_to(Player.global_position) > 2000  and Player.global_position.x > global_position.x:
		queue_free()
		Globals.spawn_miqdari -= 1
		#print("silindim")
	if global_position.distance_to(Player.global_position) < 1500  and Player.global_position.x < global_position.x:
		linear_velocity = Vector2(-engel_spd,y_quvvesi * donme_deyer)
		angular_velocity =  donme_spd * donme_deyer * delta
		#print("linear")


