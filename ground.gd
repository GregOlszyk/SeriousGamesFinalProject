extends Area2D


var ExplosionScene = preload("res://explosion.tscn")

func spawn_explosion(pos: Vector2):
	var explosion = ExplosionScene.instantiate()
	explosion.position = pos
	get_tree().current_scene.add_child(explosion)

func _on_body_entered(body):
	spawn_explosion(body.position)
	body.queue_free()  # optionally remove the hitting object
