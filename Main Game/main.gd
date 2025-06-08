extends Node2D

var recycle_score : int = 0
var trash_score : int = 0
var hearts : int = 5
var heart_sprites : Array[TextureRect]
@onready var recycle_text = $"Recycle Score"
@onready var trash_text = $"Trash Score"
@export var end_scene : PackedScene

func _ready():
	var health_bar = $HealthBar
	for heart in health_bar.get_children():
		heart_sprites.append(heart)
		
func add_recycle():
	recycle_score += 1
	recycle_text.text = str(recycle_score, " Recycled Trash")
	
func add_trash():
	trash_score += 1
	trash_text.text = str(trash_score, " Regular Trash")

func take_damage():
	hearts -= 1
	heart_sprites[hearts].texture = load("res://Assets/heart_empty_16x16.png")
	if hearts == 0:
		get_tree().call_deferred("change_scene_to_packed", end_scene)
	
func get_recyclables():
	return recycle_score

func get_trash():
	return trash_score
