extends Node2D

export (PackedScene) var inside_scene

var entered = false

var outside = "res://World.tscn"

func _ready():
	$YSort/Player.global_position = Global.player_pos

func _on_Exit_body_entered(body):
	if entered:
		if Global.player_pos2 != Vector2(0, 0):
			Global.player_pos = Global.player_pos2
		get_tree().change_scene(outside)

func _on_Exit_body_exited(body):
	entered = true


func _on_ClassroomDoorWay_body_entered(body):
	body.building = self


func _on_ClassroomDoorWay_body_exited(body):
	if body.building == self:
		body.building = null


func enter():
	Global.player_pos2 = Vector2(-640, -250)
	get_tree().change_scene(inside_scene.resource_path)
