extends Node2D

export (PackedScene) var inside_scene

func _on_DoorWay_body_entered(body):
	body.building = self


func _on_DoorWay_body_exited(body):
	if body.building == self:
		body.building = null

func enter():
	get_tree().change_scene(inside_scene.resource_path)
