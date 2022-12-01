extends Control

var menu = preload("res://Music and Sounds/Menu Move.wav")
var select = preload("res://Music and Sounds/Menu Select.wav")

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_OptionsButton_pressed():
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://UI/OptionsMenu.tscn")


func _on_StartButton_focus_entered():
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()

func _on_OptionsButton_focus_entered():
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()

func _on_QuitButton_focus_entered():
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()
