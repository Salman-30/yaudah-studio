extends CharacterBody2D

const SPEED = 300.0
const MAX_SPEED = 3000.0
const ACCELERATION = 2000.0
const FRICTION = 4000.0
var target_xvelocity = 0.0
var target_yvelocity = 0.0

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
	
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")	
	if direction:
		var target_velocity := direction * MAX_SPEED
		velocity = velocity.move_toward(target_velocity, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move_and_slide()
