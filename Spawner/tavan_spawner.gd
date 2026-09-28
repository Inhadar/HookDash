extends Node2D


const TAVAN = preload("res://Tiles/duz_divar.tscn")

const SPAWN_MESAFESI = 32*6.1
onready var Player = get_parent().get_node("Player")
var velocity = position




func _physics_process(_delta):
	if velocity.distance_to(Player.global_position) < 15000:
		spawn_ground()
		
		
		
		
func spawn_ground():
	var Tavan_instance = TAVAN.instance()
	add_child(Tavan_instance)
	Tavan_instance.global_position.x = velocity.x
	randomize()
	Tavan_instance.global_position.y = rand_range(0,60)
	
	velocity.x = velocity.x + SPAWN_MESAFESI
