extends Control

onready var fullscreen = $TabContainer/VIDEO/CenterContainer/GridContainer/fullscreen/full
onready var borderless = $TabContainer/VIDEO/CenterContainer/GridContainer/borderless/border
onready var vsync = $TabContainer/VIDEO/CenterContainer/GridContainer/vsync/vs

func _ready():
	fullscreen.pressed = OS.window_fullscreen
	borderless.pressed = OS.window_borderless
	vsync.pressed = OS.vsync_enabled

func _on_BackButton_pressed():
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_full_toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = button_pressed


func _on_border_toggled(button_pressed: bool) -> void:
	OS.window_borderless = button_pressed


func _on_vs_toggled(button_pressed: bool) -> void:
	OS.vsync_enabled = button_pressed


func _on_music_db_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_fx_db_value_changed(value: float) -> void:
	pass # Replace with function body.
