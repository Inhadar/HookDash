extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal press 
signal release


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	pass
	
	"""
	if basili:
		Input.action_press("Hook")
		#print("press")
	elif basili == false:
		Input.action_release("Hook")
		#print("release")
	"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_TouchScreenButton_pressed():
	emit_signal("press")
	
	
func _on_TouchScreenButton_released():
	emit_signal("release")
