extends Node2D

@onready var recycle_label = $"Recycle Label"
@onready var trash_label = $"Trash Label"
var health : int = 3
var hearts : Array[TextureRect]
@onready var health_bar = $HealthBar
@export var end_scene : PackedScene
@export var sound_effects : Array[AudioStream]
@onready var sound_effect_player = $"Sound Effects Player"

func take_damage():
	play_incorrect_sound()
	health -= 1
	hearts[health].texture = preload("res://Assets/heart_empty_16x16.png")
	if health == 0:
		get_tree().call_deferred("change_scene_to_packed", end_scene)

func play_collect_sound():
	sound_effect_player.stream = sound_effects[0]
	sound_effect_player.play()
	
func play_incorrect_sound():
	sound_effect_player.stream = sound_effects[1]
	sound_effect_player.play()

func _ready():
	for heart in health_bar.get_children():
		hearts.append(heart)

func _process(delta):
	recycle_label.text = str("Recycle Score: ", Global.recycle_score)
	trash_label.text = str("Trash Score: ", Global.trash_score)
