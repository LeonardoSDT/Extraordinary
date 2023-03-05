extends Node2D

func _on_YesButton_pressed():
	Global.mobile_controls = true
	Global.mobile_controls_activated = true
	Global.player_pos = Vector2(-15, 5)
	get_tree().change_scene("res://Cutscenes/IntroCutscene.tscn")

func _on_NoButton_pressed():
	Global.mobile_controls = false
	Global.mobile_controls_activated = false
	Global.player_pos = Vector2(-15, 5)
	get_tree().change_scene("res://Cutscenes/IntroCutscene.tscn")
