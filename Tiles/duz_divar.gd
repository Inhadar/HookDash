extends StaticBody2D




onready var Player = get_tree().current_scene.get_node("Player")




func _ready():
	#self.hide()=
	pass

func _physics_process(_delta):
	
	if global_position.distance_to(Player.global_position) > 2000  and Player.global_position.x > global_position.x:
		queue_free()
		#print("silindim")


