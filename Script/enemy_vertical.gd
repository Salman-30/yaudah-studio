extends CharacterBody2D

@onready var player: CharacterBody2D = $"../Player"
@onready var dash_cooldown = $dash_cooldown
const MAX_SPEED = 900.0
const ACCELERATION = 3000.0
const FRICTION = 6000.0
var direction = Vector2.ZERO
var DASH_RANGE = 500.0
var dash_capacity = true

func _on_dash_cooldown_timeout() -> void:
	dash_capacity = true

func _physics_process(delta: float) -> void:
	if position.y < player.position.y:
		direction = Vector2.DOWN
		velocity = velocity.move_toward(MAX_SPEED * direction, ACCELERATION * delta)
	elif position.y > player.position.y:
		direction = Vector2.UP
		velocity = velocity.move_toward(MAX_SPEED * direction, ACCELERATION * delta)

	if position.y + 500 < player.position.y and dash_capacity == true:
		dash_capacity = false
		dash_cooldown.start()
		move_and_collide(DASH_RANGE * Vector2.DOWN)
	if position.y - 500 > player.position.y and dash_capacity == true:
		dash_capacity = false
		dash_cooldown.start()
		move_and_collide(DASH_RANGE * Vector2.UP)	
	move_and_slide()





	
