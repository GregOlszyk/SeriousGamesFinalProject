extends Node2D

@export var trash : PackedScene
@export var spawn_interval := 1.0
@export var spawn_area_width := 400
@export var y_position := 0
var timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))



func _on_timer_timeout() -> void:
	var obj = trash.instantiate()
	var x_position = randf_range(-spawn_area_width / 2, spawn_area_width / 2)
	obj.position = Vector2(x_position, y_position)  # Start above screen
	get_tree().current_scene.add_child(obj)


func _on_spawn_rate_timer_timeout() -> void:
	spawn_interval -= 0.10
	timer.wait_time = spawn_interval
