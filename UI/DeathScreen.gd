extends Control

var stats = PlayerStats
var select = preload("res://Music and Sounds/Menu/Menu Select.wav")

func _ready():
	stats.connect("no_health", self, "on_visible")

func on_visible():
	visible = not visible

func _on_BackToMenu_pressed():
	stats.health = 6
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Restart_pressed():
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://World.tscn")
	stats.health = 6
	visible = not visible
