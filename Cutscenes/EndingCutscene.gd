extends Node2D

onready var buttonBlinking = $ButtonBlinking

func _ready():
	buttonBlinking.play("ButtonBlinking")


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://World.tscn")
