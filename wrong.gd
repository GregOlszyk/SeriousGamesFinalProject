extends Node2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(.5).timeout
	sprite.visible = false
