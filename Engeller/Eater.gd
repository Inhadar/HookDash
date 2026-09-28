extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Player = get_tree().current_scene.get_node("Player")
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	$Portal/Portal_anim.play("Portal_wave")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(_delta):
	if global_position.distance_to(Player.global_position) > 2000  and Player.global_position.x > global_position.x:
		queue_free()
		Globals.spawn_miqdari -= 1
		#print("ejder silindim")
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$Dragon/CPUParticles2D.hide()
		$Dragon/yumlu_goz.hide()
		$Area2D/CollisionShape2D.set_deferred("disabled",true)
		$Dragon/Dragon_anim.play("Dragon_wake")
		$Dragon/qas.show()
		yield(get_tree().create_timer(0.3),"timeout")
		$Dragon/Area2D2/CollisionShape2D.set_deferred("disabled",false)

		
			



func _on_Dragon_anim_animation_finished(_anim_name):
	$Portal/Portal_anim.play("Portal_closed")
	$Portal/wave1.hide()
	$Portal/wave2.hide()
	$Dragon/Area2D2/CollisionShape2D.set_deferred("disabled",true)

func _on_Portal_anim_animation_finished(_anim_name):
	$Portal/Portal_anim.stop()
	$Portal.hide()



