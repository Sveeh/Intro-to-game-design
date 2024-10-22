extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

var health = 100
var player_inattack_range = false
var can_take_damage = true

func _on_rook_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_range = true


func _on_rook_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_range = false
