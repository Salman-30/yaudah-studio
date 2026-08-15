extends CharacterBody2D
@onready var dash_cooldown = $dash_cooldown

const DASH_RANGE = 500.0
const SPEED = 300.0
const MAX_SPEED = 1000.0
const ACCELERATION = 2000.0
const FRICTION = 6000.0
var target_xvelocity = 0.0
var target_yvelocity = 0.0
var dash_capacity = true
var last_direction := Vector2.ZERO

func _on_dash_cooldown_timeout() -> void:
	dash_capacity = true

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#target_xvelocity = direction * MAX_SPEED
		#velocity.x = move_toward(velocity.x, target_xvelocity, ACCELERATION * delta)
	#else:
		#velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		
	#var directionUp := Input.get_axis("ui_up", "ui_down")
	#if directionUp:
		#target_yvelocity = directionUp * MAX_SPEED
		#velocity.y = move_toward(velocity.y, target_yvelocity, ACCELERATION * delta)
	#else:
		#velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
		#velocity.y = directionUp * SPEED
	#else:
		#velocity.y = move_toward(velocity.y, 0, SPEED)
	
	var direction := Input.get_vector("key_a", "key_d", "key_w", "key_s")	
	if direction:
		var target_velocity := direction * MAX_SPEED
		velocity = velocity.move_toward(target_velocity, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	if last_direction != direction and direction != Vector2.ZERO:
		last_direction = direction
	
	var is_dashing = false
	
	if Input.is_action_just_pressed("ui_accept") == true and dash_capacity == true and is_dashing == false:
		is_dashing = true
		dash_cooldown.start()
		dash_capacity = false
		var dash := last_direction * DASH_RANGE
		move_and_collide(dash)
		
			
	move_and_slide()
