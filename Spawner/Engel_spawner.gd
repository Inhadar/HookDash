extends Node2D









onready var coin = preload("res://Coins.tscn")


#Ilk tip engeller
onready var cube = preload("res://Engeller/divar.tscn")
onready var ucbcq = preload("res://Engeller/uchbcq.tscn")
onready var besbcq = preload("res://Engeller/besbcq.tscn")
onready var altibcq = preload("res://Engeller/altibcq.tscn")
onready var set_1 = [cube,ucbcq,besbcq,altibcq]

#Ikinci tip engeller
onready var hrkt = preload("res://Engeller/hkrt_.tscn")
onready var set_2 = [hrkt]



#Ucuncu tip engeller

onready var ucbcqM = preload("res://Engeller/ucbcqM.tscn")
onready var dordbcqM = preload("res://Engeller/dordbcqM.tscn")
onready var besbcqM = preload("res://Engeller/besbcqM.tscn")
onready var altibcqM = preload("res://Engeller/altibcqM.tscn")
onready var set_3 = [ucbcqM,dordbcqM,besbcqM,altibcqM] 


onready var Eater = preload("res://Engeller/Eater.tscn")
onready var set_4 = [Eater]


onready var follower = preload("res://Engeller/followwer.tscn")
onready var set_5 = [follower]
#onready var L = preload("res://Engeller/L.tscn")

#onready var yasti = preload("res://Engeller/yasti_divar.tscn")


onready var set_hamisi = [ucbcq,ucbcqM,dordbcqM,cube,besbcq,besbcqM,altibcq,altibcqM,Eater,follower,hrkt]
onready var setcontainer = [set_1,set_2,set_3,set_4,set_5]


var secilmis_set

onready var Player = get_parent().get_node("Player")

onready var velocity = global_position

onready var engeller

var umumi_icaze = false

var spawn_timer_icaze = true

var ne_vereyim_abime = 10
var verdin_vereceyini = 3






func _ready(): 
	set_sec()
	


func set_sec():
	randomize()
	secilmis_set = setcontainer[randi() % setcontainer.size()] 



	
	
	


func random_set_qaydasi():
		if secilmis_set == set_1:
			spawn_1()
		elif secilmis_set == set_2:
			spawn_2()
		elif secilmis_set == set_3:
			spawn_3()
		elif secilmis_set == set_4:
			spawn_4()
		elif secilmis_set == set_5:
			spawn_5()
	
func _process(_delta :float) -> void:
	#print(Globals.spawn_miqdari)
	
	if Globals.spawn_miqdari <= ne_vereyim_abime+1 and umumi_icaze:
		random_set_qaydasi()
		Globals.spawn_miqdari += 1
	elif Globals.spawn_miqdari >= ne_vereyim_abime:
		umumi_icaze = false
		set_sec()

	if Globals.spawn_miqdari <= verdin_vereceyini and umumi_icaze == false:
		umumi_icaze = true
		velocity.x += 2000

func spawn_1():
		var engel_nov
		var spawn_mesafesi = 650
		randomize()
		engeller = set_1
		engel_nov = engeller[randi() % engeller.size()]
		var engel = engel_nov.instance()
		add_child(engel)  
		engel.global_position.y =  velocity.y
		engel.global_position.x =  velocity.x
		
		var coin_instance = coin.instance()
		var coin_instance1 = coin.instance()
		
		
		add_child(coin_instance)
		add_child(coin_instance1)
		var dir_list = [-1,1]
		var y_deyeri = dir_list[randi()% dir_list.size()]
		#size = rand_range(2,3)
		
		
		
		
		
		
		
		#engel.scale  = Vector2(size,size)
		
		
		coin_instance.position.y = engel.position.y + ((engel.scale.y * 30) * y_deyeri)
		coin_instance.position.x = engel.position.x
		
		
		coin_instance1.position.y = engel.position.y 
		coin_instance1.position.x = engel.position.x + (spawn_mesafesi/2)
		
		
		velocity.x +=  spawn_mesafesi
		velocity.y = rand_range(600,1300)
	



func spawn_2():
		var engel_nov
		var spawn_mesafesi = 700
		randomize()
		engeller = set_2
		engel_nov = engeller[randi() % engeller.size()]
		var engel = engel_nov.instance()
		add_child(engel)  
		engel.global_position.y =  velocity.y
		engel.global_position.x =  velocity.x
		
		#var coin_instance = coin.instance()
		var coin_instance1 = coin.instance()
		
		
		#add_child(coin_instance)
		add_child(coin_instance1)
		#var dir_list = [-1,1]
		#var y_deyeri = dir_list[randi()% dir_list.size()]
		#size = rand_range(2,3)
		
		
		
		
		
		
		
		#engel.scale  = Vector2(size,size)
		
		
		#coin_instance.position.y = engel.position.y + ((engel.scale.y * -30))
		#coin_instance.position.x = engel.position.x
		
		
		coin_instance1.position.y = engel.position.y/2 
		coin_instance1.position.x = engel.position.x + (spawn_mesafesi/2)
		
		
		velocity.x +=  spawn_mesafesi
		velocity.y = rand_range(600,1000)
func spawn_3():
		var engel_nov
		var spawn_mesafesi = 1000
		randomize()
		engeller = set_3
		engel_nov = engeller[randi() % engeller.size()]
		var engel_nov2 = engeller[randi() % engeller.size()]
		var engel = engel_nov.instance()
		var engel2 = engel_nov2.instance()
		#var engel3 = engel_nov.instance()
		
		
		add_child(engel)  
		add_child(engel2) 
		#add_child(engel3)  
		engel.global_position.y =  velocity.y
		engel.global_position.x =  velocity.x
		
		
		#if engel.global_position.y < 700:
		#	engel2.position.y =  velocity.y +1200

		#elif engel.global_position.y > 700 and engel.global_position.y <1200:
		#	engel2.position.y = velocity.y - 1200
			
		engel2.position.y = velocity.y  - 1600
		engel2.global_position.x =  velocity.x
		
		
	
			
		
		
		
		#engel3.global_position.y =  (engel.position.y - engel2.position.y)/2
		#engel3.global_position.x =  velocity.x
		
		var coin_instance = coin.instance()
		var coin_instance1 = coin.instance()
		
		
		add_child(coin_instance)
		add_child(coin_instance1)
		#var dir_list = [-1,1]
		#var y_deyeri = dir_list[randi()% dir_list.size()]
		#size = rand_range(2,3)
		
		
		
		
		
		
		
		#engel.scale  = Vector2(size,size)
		
		
		coin_instance.position.y = (engel.position.y + engel2.position.y)/2
		coin_instance.position.x = engel.position.x
		#coin_instance.rotation_degrees = 90
		
		
		
		
		coin_instance1.position.y = engel.position.y 
		coin_instance1.position.x = engel.position.x + (spawn_mesafesi/2)
		
		
		velocity.x +=  spawn_mesafesi
		velocity.y = rand_range(600,1300)
		
		#[ucbcqM,dordbcqM,besbcqM,altibcqM]
	
	
func spawn_4():
		var engel_nov
		var spawn_mesafesi = 900
		randomize()
		engeller = set_4
		engel_nov = engeller[randi() % engeller.size()]
		var engel = engel_nov.instance()
		add_child(engel)  
		engel.global_position.y =  velocity.y
		engel.global_position.x =  velocity.x
		
		var coin_instance = coin.instance()
		#var coin_instance1 = coin.instance()
		
		
		add_child(coin_instance)
		
		
		#add_child(coin_instance1)
		#var dir_list = [-1,1]
		#var y_deyeri = dir_list[randi()% dir_list.size()]
		
		
		#size = rand_range(2,3)
		
		
		
		
		
		
		
		#engel.scale  = Vector2(size,size)
		
		
		coin_instance.position.y = engel.position.y #+ ((engel.scale.y * 30) * y_deyeri)
		coin_instance.position.x = engel.position.x - 700
		
		
		#coin_instance1.position.y = engel.position.y 
		#coin_instance1.position.x = engel.position.x + (spawn_mesafesi/2)
		
		
		velocity.x +=  spawn_mesafesi
		velocity.y = rand_range(600,1300)
func spawn_5():
		var engel_nov
		var spawn_mesafesi = 700
		randomize()
		engeller = set_5
		engel_nov = engeller[randi() % engeller.size()]
		var engel = engel_nov.instance()
		add_child(engel)  
		engel.global_position.y =  velocity.y
		engel.global_position.x =  velocity.x
		
		var coin_instance = coin.instance()
		var coin_instance1 = coin.instance()
		
		
		add_child(coin_instance)
		add_child(coin_instance1)
		var dir_list = [-1,1]
		var y_deyeri = dir_list[randi()% dir_list.size()]
		#size = rand_range(2,3)
		
		
		
		
		
		
		
		#engel.scale  = Vector2(size,size)
		
		
		coin_instance.position.y = engel.position.y + ((engel.scale.y * 150) * y_deyeri)
		coin_instance.position.x = engel.position.x
		
		
		coin_instance1.position.y = engel.position.y 
		coin_instance1.position.x = engel.position.x + (spawn_mesafesi/2)
		
		
		velocity.x +=  spawn_mesafesi
		velocity.y = rand_range(600,1300)





