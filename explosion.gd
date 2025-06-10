extends Node2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("explosion")  # replace "explode" with your animation's name
	await anim.animation_finished
	queue_free()
