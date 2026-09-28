extends CanvasLayer


var save_path = "user://ses_data.save"
var save_path1 = "user://ses_data1.save"
var config = ConfigFile.new()
var config1 = ConfigFile.new()
var load_response = config.load(save_path)
var load_response1 = config1.load(save_path1)
var decor_hereket = false

onready var decor1 = preload("res://Engeller/ucbcqM.tscn")
onready var decor2 = preload("res://Engeller/besbcqM.tscn")
onready var decor3 = preload("res://Engeller/altibcqM.tscn")





#var decor_instance





signal start
signal options 
signal quit
signal back
signal restart
signal restartoption
signal restartback
signal release_player
signal splash_screen_kecdi

var music = 0
var sound = 0







	
	
	
	
	
	
	
	
	
func _ready():
	
	$Tap/AnimatedSprite.play()
	if Globals.start_game:
		$ColorRect3.show()
		yield(get_tree().create_timer(2),"timeout")
		$Splash_screen/AnimationPlayer.play("anim_splash")
		Globals.start_game= false
	load_Sound()
	load_Music()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"),sound)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),music)
	$HSlider2.value = sound
	$HSlider.value = music
	
	$Restart/Best.text = str("Best: ",Globals.highscore1)
	$Restart/You.text = str("You: ",Globals.score)





func score(deyer):
	$Control2/score.text = str(deyer)
	
	
func highscore(highscore1,highscore2,highscore3):
	$Control/best.text = str("1st: ",highscore1)
	$Control/second.text = str("2nd: ",highscore2)
	$Control/third.text = str("3rd: ",highscore3)
	
	
	
	
	

func save_Sound():
	var save_data = File.new()
	save_data.open(save_path,File.WRITE)
	save_data.store_var(sound)
	save_data.close()
	
func load_Sound():
	var save_data = File.new()
	if save_data.file_exists(save_path):
		save_data.open(save_path,File.READ)
		sound = save_data.get_var()
		save_data.close()

func save_Music():
	var save_data = File.new()
	save_data.open(save_path1,File.WRITE)
	save_data.store_var(music)
	save_data.close()
	
func load_Music():
	var save_data = File.new()
	if save_data.file_exists(save_path1):
		save_data.open(save_path1,File.READ)
		music = save_data.get_var()
		save_data.close()







func _on_Start_pressed():
	emit_signal("start")
	
func _on_Quit_pressed():
	emit_signal("quit")


func _on_Options_pressed():
	emit_signal("options")


func _on_Back_pressed():
	emit_signal("back")
	save_Sound()
	save_Music()


func _on_HSlider_value_changed(value):
	music = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),value)
	
func _on_HSlider2_value_changed(value):
	sound = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"),value)


func _on_Decor_Timer_timeout():
	decor_hereket =true


func _on_Restart_pressed():
	emit_signal("restart")




func _on_RestartOptions_pressed():
	emit_signal("restartoption")


func _on_RestartBack_pressed():
	emit_signal("restartback")





func _on_Button_button_down():
	emit_signal("release_player")





func _on_AnimationPlayer_animation_finished(_anim_name):
	$Splash_screen/AnimationPlayer.stop()
	$ColorRect3.hide()
	emit_signal("splash_screen_kecdi")
	




func _on_ColorRect_tree_entered():
	pass # Replace with function body.


func _on_AnimationPlayer_ready():
	pass # Replace with function body.
