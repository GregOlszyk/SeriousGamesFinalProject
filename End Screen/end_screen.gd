extends Control

@onready var results : Label = $Label2
@export var main_game : PackedScene

func _ready():
	# results.text = str("You collected ", main_game.get_trash(), " pieces of trash and", main_game.get_recyclables(), " recyclables")
	print("main game is ", main_game)

func _on_playagain_pressed() -> void:
	print("Play Again Button Pressed")
	get_tree().call_deferred("change_scene_to_packed", main_game)
