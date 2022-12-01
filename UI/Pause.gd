extends Control

var pause = preload("res://Music and Sounds/Pause/Pause.wav")
var unpause = preload("res://Music and Sounds/Pause/Unpause.wav")

func _ready():
	$BlackOverlay/VBoxContainer/Resume.grab_focus()

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		if new_pause_state == true:
			$AudioStreamPlayer.stream = pause
			$AudioStreamPlayer.play()
		else:
			$AudioStreamPlayer.stream = unpause
			$AudioStreamPlayer.play()

func _on_Resume_pressed():
	$AudioStreamPlayer.stream = unpause
	$AudioStreamPlayer.play()
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

func _on_BackToMenu_pressed():
	_on_Resume_pressed()
	get_tree().change_scene("res://UI/Menu.tscn")

func _on_OptionsMenu_pressed():
	pass # Replace with function body.
