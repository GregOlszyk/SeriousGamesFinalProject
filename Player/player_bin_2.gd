extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
@onready var main_game = get_node("/root/Main")

func check_if_trash(is_trash : bool):
	if is_trash:
		main_game.add_trash()
	else:
		main_game.take_damage()

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("p2_left", "p2_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
