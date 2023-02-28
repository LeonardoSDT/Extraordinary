extends Node2D

onready var animationPlayer = $AnimationPlayer

func _ready():
	get_tree().paused = false
	animationPlayer.play("Cutscene")

func animation_finished():
	get_tree().change_scene("res://Buildings/Library/InsideLibraryBossArenaMage.tscn")
