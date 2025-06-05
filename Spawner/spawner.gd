extends Node2D

@export var trash : PackedScene
@export var spawn_interval := 1.0
@export var spawn_area_width := 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))



func _on_timer_timeout() -> void:
	var obj = trash.instantiate()
	var x_position = randf_range(-spawn_area_width / 2, spawn_area_width / 2)
	obj.position = Vector2(x_position, -50)  # Start above screen
	get_tree().current_scene.add_child(obj)
