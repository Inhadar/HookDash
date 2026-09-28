extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var reklam_cixma_deyeri = 3
#var reklam_deyisme_deyeri = 5
var splash_screen = null
var tek_reklam = true

# Called when the node enters the scene tree for the first time.




func _ready():
	if Globals.banner_hazirla == true:
		$AdMob.load_banner()
		#$AdMob2.load_banner()
		print("banner_yuklendi")
		#print("banner2_yuklendi")
		$AdMob.show_banner()
		#$AdMob2.show_banner()
		Globals.banner_hazirla = false
		
		
		

	if $Player.dead == false and Globals.video_reklam == reklam_cixma_deyeri -1:
		print("video yuklendi")
		$AdMob.load_interstitial()
		tek_reklam = true
		
		
	if Globals.start_game == false:
		$AudioStreamPlayer.play()
		
	if Globals.game_over == false:
		Globals.spawn_miqdari =0
		#get_tree().call_group("Engel", "queue_free")
		#get_tree().call_group("Tikan", "queue_free")
		Globals.score = 0
		get_tree().paused = true
		
		$Menu/ColorRect.show()
		#$Menu/ColorRect2.show()
		$Menu/Decor_container.show()
		$Menu/Label.show()
		$Menu/Buttons.show()
		$Menu/Control.show()
		$Player.load_highscore1()
		$Player.load_highscore2()
		$Player.load_highscore3()
		$Menu.highscore(Globals.highscore1,Globals.highscore2,Globals.highscore3)
	elif Globals.game_over == true:
		#get_tree().call_group("Engel", "queue_free")
		#get_tree().call_group("Tikan", "queue_free")
		$AudioStreamPlayer.play()
		Globals.score = 0
		get_tree().paused = true
		
		$Menu/ColorRect.show()
		$Menu/ColorRect2.show()
		$Menu/Decor_container.show()
		$Menu/Label.show()
		$Menu/Restart.show()
		$Player.load_highscore1()
		$Player.load_highscore2()
		$Player.load_highscore3()
		$Menu.highscore(Globals.highscore1,Globals.highscore2,Globals.highscore3)
	





func _process(_delta):
	if $Player.dead == true:
		$AudioStreamPlayer.stop()







func _on_Menu_options():
	#Hide
	$Menu/ColorRect.hide()
	$Menu/ColorRect2.hide()
	$Menu/Decor_container.hide()
	$Menu/Label.hide()
	$Menu/Buttons.hide()
	$Menu/Control.hide()
	#Show
	$Menu/ColorRect.show()
	$Menu/ColorRect2.show()
	$Menu/Decor_container.show()
	$Menu/Option.show()
	$Menu/sound.show()
	$Menu/nota.show()
	$Menu/H1.show()
	$Menu/H2.show()
	$Menu/HSlider.show()
	$Menu/HSlider2.show()
	$Menu/Back.show()
	Globals.BB = true
		
		
func _on_Menu_restartoption():
	#Hide
	$Menu/ColorRect.hide()
	$Menu/ColorRect2.hide()
	$Menu/Decor_container.hide()
	$Menu/Label.hide()
	$Menu/Restart.hide()
	#Show
	$Menu/ColorRect.show()
	$Menu/ColorRect2.show()
	$Menu/Decor_container.show()
	$Menu/Option.show()
	$Menu/sound.show()
	$Menu/nota.show()
	$Menu/H1.show()
	$Menu/H2.show()
	$Menu/HSlider.show()
	$Menu/HSlider2.show()
	$Menu/Back.show()
	Globals.BB = false
		
func _on_Menu_quit():
	get_tree().quit()


func _on_Menu_restartback():
	#Show
	Globals.spawn_miqdari =0
	#get_tree().call_group("Engel", "queue_free")
	#get_tree().call_group("Tikan", "queue_free")
	$AudioStreamPlayer.play()
	Globals.score = 0
	get_tree().paused = true
	
	$Menu/ColorRect.show()
	$Menu/Decor_container.show()
	$Menu/Label.show()
	$Menu/Buttons.show()
	$Menu/Control.show()
	#Hide
	$Menu/Restart.hide()
	$Menu/ColorRect2.hide()


func _on_Menu_back():
	if Globals.BB == true:
		#Show
		$Menu/ColorRect.show()
		#$Menu/ColorRect2.show()
		$Menu/Decor_container.show()
		$Menu/Label.show()
		$Menu/Buttons.show()
		$Menu/Control.show()
		#Hide
		$Menu/ColorRect2.hide()
		$Menu/Option.hide()
		$Menu/sound.hide()
		$Menu/nota.hide()
		$Menu/H1.hide()
		$Menu/H2.hide()
		$Menu/HSlider.hide()
		$Menu/HSlider2.hide()
		$Menu/Back.hide()
		
		
	elif Globals.BB == false:
		
		#Show
		$Menu/ColorRect.show()
		$Menu/ColorRect2.show()
		$Menu/Decor_container.show()
		$Menu/Label.show()
		$Menu/Restart.show()
		
		#Hide
		$Menu/Option.hide()
		$Menu/sound.hide()
		$Menu/nota.hide()
		$Menu/H1.hide()
		$Menu/H2.hide()
		$Menu/HSlider.hide()
		$Menu/HSlider2.hide()
		$Menu/Back.hide()



func _on_Menu_start():
	if Globals.game_over == false:
		get_tree().paused = false
		Globals.spawn_miqdari =0
		Globals.score = 0
		"""
		if Globals.video_reklam >= reklam_cixma_deyeri:
			$AdMob.load_rewarded_video()
			$AdMob.hide_banner()
			Globals.video_reklam = 0
			"""
		#Hide
		$Menu/ColorRect.hide()
		$Menu/ColorRect2.hide()
		$Menu/Decor_container.hide()
		$Menu/Label.hide()
		$Menu/Buttons.hide()
		$Menu/Control.hide()
		#$Menu/Camera2D3.current = false
		#$Player/Camera2D.current = true
		
		#Show 
		$Menu/Control2.show()
		$Menu/Tap.show()
	elif Globals.game_over == true:
		get_tree().paused = false
		Globals.spawn_miqdari =0
		Globals.score = 0
		"""
		if Globals.video_reklam >= reklam_cixma_deyeri:
			$AdMob.load_rewarded_video()
			$AdMob.hide_banner()
			Globals.video_reklam = 0
			"""
		#Hide
		$Menu/ColorRect.hide()
		$Menu/ColorRect2.hide()
		$Menu/Decor_container.hide()
		$Menu/Label.hide()
		$Menu/Buttons.hide()
		$Menu/Control.hide()
		#Show 
		$Menu/Control2.show()
		$Menu/Tap.show()
func _on_Menu_restart():
	if Globals.game_over == true:
		get_tree().paused = false
		Globals.spawn_miqdari =0
		Globals.score = 0
		"""
		if Globals.video_reklam >= reklam_cixma_deyeri:
			$AdMob.load_rewarded_video()
			$AdMob.hide_banner()
			Globals.video_reklam = 0
			"""
		#Hide
		$Menu/ColorRect.hide()
		$Menu/ColorRect2.hide()
		$Menu/Decor_container.hide()
		$Menu/Label.hide()
		$Menu/Restart.hide()
		#Show 
		$Menu/Control2.show()
		$Menu/Tap.show()






func _on_Menu_release_player():
	$Player._stop_until_tap()
	$Menu/Tap.hide()
	get_tree().paused = false
	





func _on_AdMob_banner_loaded():
	print("banner gosterilir")

func _on_AdMob_banner_failed_to_load(error_code):
	print("banner_failed ",error_code)





func _on_Menu_splash_screen_kecdi():
	Globals.start_game = false
	print(Globals.start_game)
	$AudioStreamPlayer.play()



func _on_Player_player_dead():
	
	
	if Globals.video_reklam >= reklam_cixma_deyeri and tek_reklam == true:
		$AdMob.show_interstitial()
		print("reklam1 gosterilir")
		tek_reklam = false

		
		
	#if $Player.dead == true:
		

		
	#if Globals.video_reklam >= reklam2_cixma_deyeri:
	#	$AdMob2.show_interstitial()
	#	print("reklam2 gosterilir")
	#if $Player.dead == true:
	#	get_tree().paused = true
	#	$Player._start_until_tap()
	#	$Menu/Tap.show()
	#	$Menu/Tap.set_deferred("disabled", true)

func _on_AdMob_interstitial_closed():
	Globals.video_reklam = 0
	print("teze reklam")
