extends CharacterBody2D


const SPEED = 1500.0
const JUMP_VELOCITY = -400.0
const MIN_X = -2100  #added boundaries
const MAX_X = 2100  # added boundaries so the bins dont go off map


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("p1_left", "p1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Clamp the player's position between X bounds
	position.x = clamp(position.x, MIN_X, MAX_X)
