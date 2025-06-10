extends Area2D

@export var ExplosionScene : PackedScene

func _on_body_entered(body: Node2D):
	var explosion = ExplosionScene.instantiate()
	explosion.position = body.global_position
	get_tree().current_scene.add_child(explosion)
