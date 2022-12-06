extends Control

var stats = PlayerStats
var menu = preload("res://Music and Sounds/Menu/Menu Move.wav")
var select = preload("res://Music and Sounds/Menu/Menu Select.wav")

func _ready():
	stats.connect("no_health", self, "on_visible")

func on_visible():
	visible = not visible
	if visible:
		$BlackOverlay/VBoxContainer/Restart.grab_focus()

func _on_BackToMenu_pressed():
	stats.health = 6
	audio_select()
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Restart_pressed():
	audio_select()
	get_tree().change_scene("res://World.tscn")
	stats.health = 6
	visible = not visible

func audio_select():
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()

func audio_menu():
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()


func _on_Restart_focus_entered():
	audio_menu()


func _on_BackToMenu_focus_entered():
	audio_menu()
