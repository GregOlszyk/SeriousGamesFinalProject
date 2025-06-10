extends Node2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("explosion")
	anim.animation_finished.connect(_on_anim_finished)

func _on_anim_finished():
	queue_free()
