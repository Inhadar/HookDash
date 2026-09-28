extends KinematicBody2D



signal player_dead



onready var Menu = get_tree().current_scene.get_node("Menu")
#onready var Admob = get_parent().get_node("Admob")
var game_over = false
export var dead = false
var dead_for_reklam = true

var MOVE_SPD = 0
var MIN_SPD = 0
var MAX_SPD = 0
var GRAVITY = 0
const JUMP_FORCE = 1550
const FRICTION_AIR = 0.966
const FRICTION_GROUND = 0.85
const CHAIN_PULL = 75
const HIGHSCORE1 = "user://highscore11.save"
const HIGHSCORE2 = "user://highscore21.save"
const HIGHSCORE3 = "user://highscore31.save"

var velocity = Vector2(0,0)
var chain_velocity :=  Vector2(0,0)
var can_jump = false
var chain_bucaq = 10


var score_changed = false
var oyun_sonu_score  = false
var dead_sound = true
var icaze = false
	
var olcme = 0
var suret_bucaq_deyeri = 0

var hook_at = false

var Tap = false



func _ready():
	dead= false
	$AnimationPlayer.play("goz_qirp")



"""
func _input(event:InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			$Chain.shoot(event.position - get_viewport().size * 0.5)
		else:
			$Chain.release()
	"""
	
	
	
	
	
	
	
func _stop_until_tap():
	MOVE_SPD = 600
	MIN_SPD = -2000
	MAX_SPD = 2500
	GRAVITY = 55
	Tap = true

func _start_until_tap():
	MOVE_SPD = 0
	MIN_SPD = 0
	MAX_SPD = 0
	GRAVITY = 0
	Tap = false


	
	
	
	
func _input(event):
	if event.is_action_pressed("Hook") and game_over == false and Tap:
		$Chain.shoot(Vector2(chain_bucaq,-90) * 0.5 ) # Vector2 nin x deyerin deyismek hookun atma bucagin deyisir. varuable elave olunub qiraqdan suretle beraber deyisdirile biler
		$Hook.play()
		rotation_degrees = -15
		
		hook_at = true
	elif event.is_action_released("Hook"):
		$Chain.release()
		$Hook.stop()
		if game_over == false:
			rotation_degrees = 0
		hook_at =false
	elif game_over == true:
		$Chain.release()
		if game_over == false:
			rotation_degrees = 0
		hook_at =false

###### Problem Burda


func _physics_process(_delta:float) -> void:
	
	#print(velocity.y)
	
	#Menu.score(round(global_position.x * (delta/2)))
	if velocity.y > 500 and hook_at == false and game_over == false:
		rotation_degrees = 15
	#print(global_position.x)

		
#High score saver
	if oyun_sonu_score == true:
		#print(oyun_sonu_score)
		if Globals.score > Globals.highscore1:
			Globals.highscore3 = Globals.highscore2
			save_highscore3()
			Globals.highscore2 = Globals.highscore1
			save_highscore2()
			Globals.highscore1 = Globals.score
			save_highscore1()
		elif Globals.score < Globals.highscore1 and Globals.score > Globals.highscore2:
			Globals.highscore3 = Globals.highscore2
			save_highscore3()
			Globals.highscore2 = Globals.score
			save_highscore2()
		elif Globals.score < Globals.highscore2 and Globals.score > Globals.highscore3:
			Globals.highscore3 = Globals.score
			save_highscore3()







	#print(global_position)
	#olcme += 1 * delta
	#print(olcme)
	velocity.x = MOVE_SPD
	#if olcme >= 5:
	#	olcme = 0
	#	MOVE_SPD += 10
	#print(velocity.y)
	
	
	#FALL DAMAGE
	#if velocity.y > 1130:
		#var _dead = get_tree().reload_current_scene()
	#	$AnimationPlayer.play("dead")
	#Walking
	#var walk = (Input.get_action_strength("Right") - Input.get_action_strength("Left")) * MOVE_SPD
	#velocity.x = MOVE_SPD
	#yield(get_tree().create_timer(1),"timeout")
	#MOVE_SPD += 1
	
	#Faling
	velocity.y += GRAVITY
	
	if $Chain.hooked and game_over == false:
		chain_velocity = to_local($Chain.tip).normalized() * CHAIN_PULL
		if chain_velocity.y > 0:
			chain_velocity.y *= 0.7
		else:
			chain_velocity.y *= 1.7
			
		#if sign(chain_velocity.x) != sign(walk):
		#	chain_velocity.x *= 0.7
			
	else:
		chain_velocity = Vector2(0,0)
	velocity += chain_velocity
	
	
	var snap = Vector2.DOWN * 16 if !hook_at else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity,snap,Vector2.UP)
	#velocity.x -= walk
	velocity.x = clamp(velocity.x,MIN_SPD,MAX_SPD)
	velocity.y = clamp(velocity.y,MIN_SPD,MAX_SPD)
	
	var grounded = is_on_floor()
	if grounded:
		velocity.x *= FRICTION_GROUND
		can_jump = true
		if velocity.y >= 5:
			velocity.y = 5
	elif is_on_ceiling() and velocity.y <= 5:
		velocity.y = -5
	if !grounded:
		velocity.x *= FRICTION_AIR
		if velocity.y > 0:
			velocity.y *= FRICTION_AIR
	
	
	#Jumping
	if Input.is_action_just_pressed("Jump"):
		if grounded:
			velocity.y = -JUMP_FORCE

		elif can_jump:
			can_jump = false
			velocity.y = -JUMP_FORCE
			
			



func save_highscore1():
	var save_data = File.new()
	save_data.open(HIGHSCORE1,File.WRITE)
	save_data.store_var(Globals.highscore1)
	save_data.store_var($Label.text)
	save_data.close()
	
func load_highscore1():
	var save_data = File.new()
	if save_data.file_exists(HIGHSCORE1):
		save_data.open(HIGHSCORE1,File.READ)
		Globals.highscore1 = save_data.get_var()
		$Label.text = save_data.get_var()
		save_data.close()
	
func save_highscore2():
	var save_data = File.new()
	save_data.open(HIGHSCORE2,File.WRITE)
	save_data.store_var(Globals.highscore2)
	save_data.close()
	
func load_highscore2():
	var save_data = File.new()
	if save_data.file_exists(HIGHSCORE2):
		save_data.open(HIGHSCORE2,File.READ)
		Globals.highscore2 = save_data.get_var()
		save_data.close()
	
func save_highscore3():
	var save_data = File.new()
	save_data.open(HIGHSCORE3,File.WRITE)
	save_data.store_var(Globals.highscore3)
	save_data.close()
	
func load_highscore3():
	var save_data = File.new()
	if save_data.file_exists(HIGHSCORE3):
		save_data.open(HIGHSCORE3,File.READ)
		Globals.highscore3 = save_data.get_var()
		save_data.close()
	



func flash():
	$dead_body.material.set_shader_param("flash_modifier",2)
	$Flash_timer.start()







func _on_Area2D_area_entered(area):
	if area.is_in_group("Tikan"):
		$Label.text = "Eceb oldu 7000 defe lenetlendin"
		game_over = true
		Globals.game_over = true
		#var _dead = get_tree().reload_current_scene()
		if dead_for_reklam:
			Globals.video_reklam += 1
			print(Globals.video_reklam)
			dead_for_reklam =false
		if dead == false:
			$Dead.play()
			#$AnimationPlayer.play("dead")
			flash()
			#self.rotation_degrees = rotation_degrees
			$dead_goz.show()
			$goz.hide()
			$dead_body.show()
			dead =true
			MOVE_SPD = 0
			GRAVITY = 0
			oyun_sonu_score = true
			emit_signal("player_dead")
			
			
			
			
	elif area.is_in_group("Engel"):
		game_over = true
		Globals.game_over = true
		if dead_for_reklam:
			Globals.video_reklam += 1
			print(Globals.video_reklam)
			dead_for_reklam = false
		#var _dead = get_tree().reload_current_scene()
		if dead == false:
			$Dead.play()
			#$AnimationPlayer.play("dead")
			flash()
			#self.rotation_degrees = rotation_degrees
			$dead_goz.show()
			$goz.hide()
			$dead_body.show()
			MOVE_SPD = 0
			GRAVITY = 80
			dead =true
			#$Area2D/CollisionShape2D.set_deferred("disabled",true)
			#$CollisionShape2D.set_deferred("disabled",true)
			
			emit_signal("player_dead")
			oyun_sonu_score = true
		if dead_sound:
			$Dead.play()
			dead_sound = false
			#yield(get_tree().create_timer(0.79),"timeout")
	
	if area.is_in_group("coin"):
		Globals.score += 1
		$Coin.play()
		score_changed = true
		#print(score_changed)
		#print(score)
		Menu.score(Globals.score)
	else:
		score_changed = false
"""
func _on_VisibilityNotifier2D_screen_exited():
	#var _dead = get_tree().reload_current_scene()
	oyun_sonu_score = true
	$AnimationPlayer.play("dead")
	if dead_sound:
		$Dead.play()
		dead_sound = false
		#yield(get_tree().create_timer(0.79),"timeout")
	#var _restart = get_tree().change_scene("res://Restart.tscn")
"""

func _on_AnimationPlayer_animation_finished(_anim_name):
	$AnimationPlayer.stop()
	#self.hide()


func _on_TouchB_press():
	if game_over == false and Tap:
		$Chain.shoot(Vector2(chain_bucaq,-90) * 0.5 )
		$Hook.play()
		rotation_degrees = -15
		hook_at = true

func _on_TouchB_release():
	$Chain.release()
	$Hook.stop()
	if game_over == false:
		rotation_degrees = 0
		hook_at =false



#func _on_dead_sound_timeout():
	#icaze = true
	#$dead_sound.stop()


#func _on_Dead_finished():
	#var _restart = get_tree().change_scene("res://Restart.tscn")
	#Globals.game_over = true
	#self.hide()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Engel"):
		Globals.game_over = true
		game_over = true
		if dead_for_reklam:
			Globals.video_reklam += 1
			print(Globals.video_reklam)
			dead_for_reklam = false
		if dead == false:
			flash()
			self.rotation_degrees = -30
			$dead_goz.show()
			$goz.hide()
			$dead_body.show()
			MOVE_SPD = 0
			GRAVITY = 80
			dead =true
			emit_signal("player_dead")
		#$Area2D/CollisionShape2D.set_deferred("disabled",true)
		#$CollisionShape2D.set_deferred("disabled",true)
			oyun_sonu_score = true
		if dead_sound:
			$Dead.play()
			dead_sound = false


func _on_Flash_timer_timeout():
	$dead_body.material.set_shader_param("flash_modifier",0)
	$Dead_timer.start()
	#print("dlasg")
	#self.hide()


func _on_Dead_timer_timeout():
	var _restart = get_tree().reload_current_scene()
	Globals.game_over = true
	game_over = true
	self.hide()
	#print("oldum")
