extends Control

onready var fullscreen = $TabContainer/VIDEO/CenterContainer/GridContainer/fullscreen/full
onready var borderless = $TabContainer/VIDEO/CenterContainer/GridContainer/borderless/border
onready var vsync = $TabContainer/VIDEO/CenterContainer/GridContainer/vsync/vs

var menu = preload("res://Music and Sounds/Menu/Menu Move.wav")
var select = preload("res://Music and Sounds/Menu/Menu Select.wav")

func _ready():
	fullscreen.pressed = OS.window_fullscreen
	borderless.pressed = OS.window_borderless
	vsync.pressed = OS.vsync_enabled
	$BackButton.grab_focus()

func _on_BackButton_pressed():
	audio_select()
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_full_toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = button_pressed
	audio_select()


func _on_border_toggled(button_pressed: bool) -> void:
	OS.window_borderless = button_pressed
	audio_select()


func _on_vs_toggled(button_pressed: bool) -> void:
	OS.vsync_enabled = button_pressed
	audio_select()

func audio_select():
#	if $AudioStreamPlayer.volume_db == 0:
#		if Global.fx_enabled:
#			$AudioStreamPlayer.volume_db = Global.fx_volume
#		else:
#			$AudioStreamPlayer.volume_db = -255
	$AudioStreamPlayer.stream = select
	$AudioStreamPlayer.play()

func _on_music_db_value_changed(value: float) -> void:
	Global.music_volume = value
	$TabContainer/AUDIO/CenterContainer/GridContainer/music_level/HBoxContainer/music2.text = str(value)
	if value == $TabContainer/AUDIO/CenterContainer/GridContainer/music_level/music_db.min_value:
		Global.music_enabled = false


func _on_fx_db_value_changed(value: float) -> void:
	Global.fx_volume = value
	$TabContainer/AUDIO/CenterContainer/GridContainer/fx_volume/HBoxContainer/fx2.text = str(value)
	if value == $TabContainer/AUDIO/CenterContainer/GridContainer/fx_volume/fx_db.min_value:
		Global.fx_enabled = false

func _on_full_focus_entered():
	audio_menu()


func _on_border_focus_entered():
	audio_menu()


func _on_vs_focus_entered():
	audio_menu()


func _on_BackButton_focus_entered():
	audio_menu()


func audio_menu():
#	if $AudioStreamPlayer.volume_db == 0:
#		if Global.fx_enabled:
#			$AudioStreamPlayer.volume_db = Global.fx_volume
#		else:
#			$AudioStreamPlayer.volume_db = -255
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()
