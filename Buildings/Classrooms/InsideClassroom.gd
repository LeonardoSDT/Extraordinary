extends Node2D

export (PackedScene) var inside_scene

var entered = false

var outside = "res://Buildings/Classrooms/InsideClassrooms.tscn"

func _on_Exit_body_entered(body):
	if entered:
		get_tree().change_scene(outside)

func _on_Exit_body_exited(body):
	entered = true


func enter():
	get_tree().change_scene(inside_scene.resource_path)
