extends Control

var stats = PlayerStats

func _ready():
	stats.connect("no_health", self, "on_visible")

func on_visible():
	visible = not visible

func _on_BackToMenu_pressed():
	stats.health = 6
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Restart_pressed():
	get_tree().change_scene("res://World.tscn")
	stats.health = 6
	visible = not visible
