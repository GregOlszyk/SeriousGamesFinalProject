extends RigidBody2D

@export var recyclable_sprites : Array[AtlasTexture]
@export var trash_sprites : Array[AtlasTexture]
@onready var sprite = $Sprite2D
var is_recyclable : bool
var interval : int = 25
# the size of each sprite array should be the same
@export var num_sprites = 4
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var main_game = get_parent()
@export var collect_effect : PackedScene
@export var wrong_effect : PackedScene

func _ready():
	# randomly chooses if the trash is recyclable
	is_recyclable = randi() % 2 == 0
	# sets the sprite depending on if its recyclable
	var sprite_index = randi() % num_sprites
	if is_recyclable:
		sprite.texture = recyclable_sprites[sprite_index]
	else:
		sprite.texture = trash_sprites[sprite_index]
	if (Global.recycle_score % interval == 0 or Global.trash_score % interval ==0):
		main_game.heal()

func _physics_process(delta):
	linear_velocity.y += gravity * delta


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var obj
		if body.is_in_group("Recycle") and is_recyclable:
			obj = collect_effect.instantiate()
			Global.recycle_score += 1
			main_game.play_collect_sound()
		elif body.is_in_group("Trash") and !is_recyclable:
			obj = collect_effect.instantiate()
			Global.trash_score += 1
			main_game.play_collect_sound()
		else:
			obj = wrong_effect.instantiate()
			main_game.take_damage()
		body.add_child(obj)
		obj.position.x = 0
		obj.position.y = 0
		queue_free()
	
