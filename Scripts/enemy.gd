extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

var health = 100
var player_inattack_range = false
var can_take_damage = true

func _physics_process(delta: float) -> void:
	deal_with_damage()
	
	if player_chase:
		position += (player.position - position)/speed
		
		


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_range = true


func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_range = false

func deal_with_damage():
	if player_inattack_range and global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 20
			$take_damage_cooldown.start()
			can_take_damage = false
			print("slime health = ", health)
			if health <= 0:
				self.queue_free()


func _on_take_damage_cooldown_timeout() -> void:
	can_take_damage = true
