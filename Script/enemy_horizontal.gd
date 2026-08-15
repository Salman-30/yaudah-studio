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
	if position.x < player.position.x:
		direction = Vector2.RIGHT
		velocity = velocity.move_toward(MAX_SPEED * direction, ACCELERATION * delta)
	if position.x > player.position.x:
		direction = Vector2.LEFT
		velocity = velocity.move_toward(MAX_SPEED * direction, ACCELERATION * delta)
		
	if position.x + 500 < player.position.x and dash_capacity == true:
		dash_capacity = false
		dash_cooldown.start()
		move_and_collide(DASH_RANGE * Vector2.RIGHT)
	if position.x - 500 > player.position.x and dash_capacity == true:
		dash_capacity = false
		dash_cooldown.start()
		move_and_collide(DASH_RANGE * Vector2.LEFT)	

	move_and_slide()
