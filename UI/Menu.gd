extends Control

var menu = preload("res://Music and Sounds/Menu/Menu Move.wav")
var select = preload("res://Music and Sounds/Menu/Menu Select.wav")

func _ready():
	$StartButton.grab_focus()

func _on_StartButton_pressed():
	audio_select()
	get_tree().change_scene("res://Cutscenes/IntroCutscene.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_OptionsButton_pressed():
	audio_select()
	get_tree().change_scene("res://UI/OptionsMenu.tscn")


func _on_StartButton_focus_entered():
	audio_menu()

func _on_OptionsButton_focus_entered():
	audio_menu()

func _on_QuitButton_focus_entered():
	audio_menu()

func audio_select():
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()

func audio_menu():
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()
