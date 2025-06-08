extends RigidBody2D

@export var recyclable_sprites : Array[AtlasTexture]
@export var trash_sprites : Array[AtlasTexture]
@onready var sprite = $Sprite2D
var is_recyclable : bool
# the size of each sprite array should be the same
@export var num_sprites = 4
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var main_game = get_parent()

func _ready():
	# randomly chooses if the trash is recyclable
	is_recyclable = randi() % 2 == 0
	# sets the sprite depending on if its recyclable
	var sprite_index = randi() % num_sprites
	if is_recyclable:
		sprite.texture = recyclable_sprites[sprite_index]
	else:
		sprite.texture = trash_sprites[sprite_index]

func _physics_process(delta):
	linear_velocity.y += gravity * delta


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.is_in_group("Recycle") and is_recyclable:
			Global.recycle_score += 1
		elif body.is_in_group("Trash") and !is_recyclable:
			Global.trash_score += 1
		else:
			main_game.take_damage()
		queue_free()
