extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state

func _on_Resume_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

func _on_BackToMenu_pressed():
	_on_Resume_pressed()
	get_tree().change_scene("res://UI/Menu.tscn")

func _on_OptionsMenu_pressed():
	pass # Replace with function body.
