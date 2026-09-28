extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var player 
var speed = 400
var izle =  false
var posi = Vector2.ZERO
var firlan
var ac_agzini_yum_gozunu = true


onready var Player = get_tree().current_scene.get_node("Player")
onready var rotation_spd = 20
var rotation_spd_whatch = 2.0
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var goz_qirp_wait_time = rand_range(2,4)
	$"arada_goz qirp".wait_time = goz_qirp_wait_time
	$"arada_goz qirp".start()
	var random_size = rand_range(1,2)
	var random_rotation = rand_range(0,360)
	rotation = random_rotation
	scale = Vector2(random_size,random_size)
	#$Node2D.scale = Vector2(random_size,random_size)
	#$Area2D2.scale = Vector2(random_size,random_size)
	
	firlan = true
	pass # Replace with function b

func _physics_process(delta):

	if global_position.distance_to(Player.global_position) > 3000  and Player.global_position.x > global_position.x:
		queue_free()
		Globals.spawn_miqdari -= 1
	elif global_position.distance_to(Player.global_position) < 650 and Player.global_position.x < global_position.x:
		$Area2D/CollisionShape2D.set_deferred("disabled",false)
		#print("gozem silindim")

	#var dir :Vector2  = player.position - position
	#rotation = dir.angle()
	#look(Player,delta)
	
	if firlan:
		rotation_degrees += rotation_spd * delta
		#look(Player,delta)
	#look_at(player.global_position)
	#posi = Vector2.ZERO
	
	
	if player != null and izle == true:
		$"arada_goz qirp".stop()
		$Node2D/AnimatedSprite.play("wild")
		$Area2D.hide()
		$Area2D2.show()
		$Node2D/AnimatedSprite.offset.x = 150
		$Area2D2/CollisionShape2D.set_deferred("disabled",false) 
		$Area2D2/CollisionShape2D2.set_deferred("disabled",false) 
		posi = global_position.direction_to(player.global_position) * speed * delta
		look(player,delta)
		
	else:
		posi = Vector2.ZERO

	posi = move_and_collide(posi)



func look(target,delta):
	var direction = (target.global_position - global_position)
	var angleto = transform.x.angle_to(direction)
	rotate(sign(angleto) * min(delta * rotation_spd_whatch , abs(angleto)))
	





func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player = body
		izle = true
		firlan= false
		$azadsan.start()



func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		player = null
		izle = false
		firlan = true


func _on_azadsan_timeout():
	izle = false


func _on_arada_goz_qirp_timeout():
	$Node2D/AnimatedSprite.play("blink")


func _on_AnimatedSprite_animation_finished():
	$Node2D/AnimatedSprite.stop()
