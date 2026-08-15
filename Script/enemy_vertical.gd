extends CharacterBody2D

@onready var player: CharacterBody2D = $"../Player"
const MAX_SPEED = 900.0
const ACCELERATION = 3000.0
const FRICTION = 6000.0
var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if position.y < player.position.y:
		direction = Vector2.DOWN
		velocity = velocity.move_toward(MAX_SPEED * direction, ACCELERATION * delta)
	elif position.y > player.position.y:
		direction = Vector2.UP
		velocity = velocity.move_toward(MAX_SPEED * direction, ACCELERATION * delta)

	move_and_slide()





	
