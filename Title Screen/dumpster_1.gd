extends Sprite2D

var speed = 100  # pixels per second
var direction = 1  # 1 = right, -1 = left

# Change these to set how far left/right it goes
var left_limit = 100
var right_limit = 1050

func _process(delta):
	position.x += direction * speed * delta

	if position.x > right_limit:
		position.x = right_limit
		direction = -1
	elif position.x < left_limit:
		position.x = left_limit
		direction = 1
