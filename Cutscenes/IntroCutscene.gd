extends Node2D

onready var animationPlayer = $AnimationPlayer
onready var buttonBlinking = $ButtonBlinking

func _ready():
	animationPlayer.play("Cutscene")

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Buildings/Laboratories/InsideLaboratories.tscn")

func animation_finished():
	buttonBlinking.play("ButtonBlinking")
