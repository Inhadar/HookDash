extends Node



onready var ucb = preload("res://Engeller/uchbcq.tscn")
onready var dordb = preload("res://Engeller/divar.tscn")
onready var besb = preload("res://Engeller/besbcq.tscn")
onready var altib  = preload("res://Engeller/altibcq.tscn")







onready var path_follow = $Path2D/PathFollow2D
onready var block = $Path2D/PathFollow2D/Node2D
var speed = 200

#var asagi = false
#var yuxari = false
var mistik = true
var random_offset


func _ready():
	randomize()
	var object_list = [ ucb,dordb,besb,altib]
	var hrkt_object = object_list[randi() % object_list.size()]
	var object = hrkt_object.instance()
	$Path2D/PathFollow2D/Node2D.add_child(object)
	random_offset = rand_range(0,343)
	path_follow.offset = random_offset

func _physics_process(delta):
	
	
		
	if path_follow.unit_offset == 0:
		mistik = true
		#asagi = true
		#yuxari = false
	elif path_follow.unit_offset == 1:
		mistik = false
		#yuxari = true
		#asagi = false
	if mistik:#asagi:
		path_follow.set_offset(path_follow.get_offset() + speed * delta)
	elif mistik == false:#yuxari:
		path_follow.set_offset(path_follow.get_offset() - speed * delta)

	



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	#print("hrktli silindim")
	Globals.spawn_miqdari -= 1

func _on_VisibilityNotifier2D_screen_entered():
	$Path2D.show()
