extends KinematicBody2D

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200

enum {
	IDLE,
	WANDER,
	CHASE,
	ATTACK
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

var state = CHASE

onready var sprite = $Sprite
onready var bossStats = $CanvasLayer/VBoxContainer/HealthUIBoss/BossStats
onready var playerDetectionZone = $PlayerDetectionZone
onready var attackPlayerDetectionZone = $AttackPlayerDetectionZone
onready var hurtbox = $Hurtbox
onready var softCollision = $SoftColliision
onready var wanderController = $WanderController
onready var animationPlayer = $AnimationPlayer
onready var blinkAnimationPlayer = $BlinkAnimationPlayer

func _ready():
	state = pick_random_state([IDLE, WANDER])

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, 200 * delta)
			seek_player()
			if wanderController.get_time_left() == 0:
				update_wander()
			animationPlayer.play("Idle")
		
		WANDER:
			seek_player()
			if wanderController.get_time_left() == 0:
				update_wander()
			accelerate_towards_point(wanderController.target_position, delta)
			if global_position.distance_to(wanderController.target_position) <= MAX_SPEED * delta:
				update_wander()
			animationPlayer.play("Running")
		
		CHASE:
			var player = playerDetectionZone.player
			attack_player()
			if player != null:
				accelerate_towards_point(player.global_position, delta)
				animationPlayer.play("Running")
			else:
				state = IDLE
		ATTACK:
			var player = attackPlayerDetectionZone.player
			attack_player()
			if player != null:
				animationPlayer.play("Attacking")
		
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400
	velocity = move_and_slide(velocity)

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

func attack_player():
	if attackPlayerDetectionZone.can_attack_player():
		state = ATTACK
	else:
		state = CHASE

func update_wander():
	state = pick_random_state([IDLE, WANDER])
	wanderController.start_wander_timer(rand_range(1, 3))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func _on_Hurtbox_area_entered(area):
	bossStats.health -= area.damage
	knockback = area.knockback_vector * 100
	hurtbox.create_hit_effect()
	hurtbox.start_invincibility(0.6)

func _on_Hurtbox_invincibility_started():
	blinkAnimationPlayer.play("Start")

func _on_Hurtbox_invincibility_ended():
	blinkAnimationPlayer.play("Stop")

func attack_animation_finished():
	state = WANDER


func _on_BossStats_no_health():
	queue_free()
	get_tree().change_scene("res://Cutscenes/CutsceneBossDeath.tscn")
