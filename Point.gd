extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#onready var 




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.onre
	
onready var Player = get_tree().current_scene.get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	if global_position.distance_to(Player.global_position) > 2000 and global_position.x < Player.global_position.x:
		queue_free()
		#print("coins silindim")


func _on_Point_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("take")


func _on_AnimationPlayer_animation_finished(_anim_name):
	$AnimationPlayer.stop()
	$sparkles.show()
	$sparkles/AnimatedSprite.play()
	$sparkles/AnimatedSprite2.play()
	$sparkles/AnimatedSprite3.play()


func _on_AnimatedSprite_animation_finished():
	queue_free()

