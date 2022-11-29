extends Area2D

var player = null

func can_attack_player():
	return player != null

func _on_AttackPlayerDetectionZone_body_entered(body):
	player = body

func _on_AttackPlayerDetectionZone_body_exited(body):
	player = null
