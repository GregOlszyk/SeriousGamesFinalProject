extends Control

@onready var result_label = $Label2
@onready var game_over_player = $"Game Over Player"

func _ready():
	result_label.text = str("You collected ", Global.trash_score, " pieces of trash and ", Global.recycle_score, " recyclables")
	game_over_player.play()



func _on_playagain_pressed() -> void:
	Global.recycle_score = 0
	Global.trash_score = 0
	get_tree().change_scene_to_file("res://Main Game/main.tscn")


func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Title Screen/control.tscn")
