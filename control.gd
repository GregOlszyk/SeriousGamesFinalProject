extends Control

@export var main_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$tutorial.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	print("Game has started")
	




func _on_howto_play_pressed() -> void:
	$tutorial.visible = true
