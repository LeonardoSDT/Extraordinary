extends Control

var pause = preload("res://Music and Sounds/Pause/Pause.wav")
var unpause = preload("res://Music and Sounds/Pause/Unpause.wav")
var menu = preload("res://Music and Sounds/Menu/Menu Move.wav")
var select = preload("res://Music and Sounds/Menu/Menu Select.wav")

onready var fullscreen = $"../OptionsPause/TabContainer/VIDEO/CenterContainer/GridContainer/fullscreen/full"
onready var borderless = $"../OptionsPause/TabContainer/VIDEO/CenterContainer/GridContainer/borderless/border"
onready var vsync = $"../OptionsPause/TabContainer/VIDEO/CenterContainer/GridContainer/vsync/vs"


func _ready():
	$"../OptionsPause".visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		if new_pause_state == true:
			$BlackOverlay/VBoxContainer/Resume.grab_focus()
			$AudioStreamPlayer.stream = pause
			$AudioStreamPlayer.play()
			$"../OptionsPause".visible = false
		else:
			$AudioStreamPlayer.stream = unpause
			$"../OptionsPause".visible = false
			$AudioStreamPlayer.play()

func _on_Resume_pressed():
	$AudioStreamPlayer.stream = unpause
	$AudioStreamPlayer.play()
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

func _on_BackToMenu_pressed():
	audio_select()
	_on_Resume_pressed()
	get_tree().change_scene("res://UI/Menu.tscn")

func _on_OptionsMenu_pressed():
	$"../OptionsPause".visible = true
	audio_select()

func audio_select():
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()

func audio_menu():
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()

func _on_Resume_focus_entered():
	audio_menu()


func _on_OptionsMenu_focus_entered():
	audio_menu()


func _on_BackToMenu_focus_entered():
	audio_menu()


func _on_BackButton_pressed():
	$"../OptionsPause".visible = false
	audio_select()


func _on_full_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	audio_select()


func _on_border_toggled(button_pressed):
	OS.window_borderless = button_pressed
	audio_select()


func _on_vs_toggled(button_pressed):
	OS.vsync_enabled = button_pressed
	audio_select()
