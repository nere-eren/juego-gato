extends CharacterBody2D

# variables de movimiento
@export var max_speed = 40000 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 8000 ## Aceleracion del jugador
@export var friction = 1 ## Friccion que se ejerce cunado el jugador deja de moverse

func _physics_process(delta):
	
	var dir_x = Input.get_axis("left","right")
	var dir_y = Input.get_axis("up","down")
	
	var dir: Vector2 = Input.get_vector("left","right","up", "down")
	
	degrees_move(input_handle(dir), delta)
	
	#if (rotation_degrees == 0):
		#if($Rays/RayCast2DMiddle.is_colliding()):
			#if (dir_x):
				#velocity.x = dir_x * aceleration * delta
				#velocity.x = clamp(velocity.x, -max_speed, max_speed)
			#else:
				#velocity.x = move_toward(dir_x * velocity.x,0, aceleration * delta)
		#elif($Rays/RayCast2DLeftDown.is_colliding()):
			#if (dir_x == -1):
				#velocity.x = dir_x * aceleration * delta
				#velocity.x = clamp(velocity.x, -max_speed, max_speed)
			#else:
				#velocity.x = move_toward(dir_x * velocity.x,0, aceleration * delta)
		#elif($Rays/RayCast2DRightDown.is_colliding()):
			#if (dir_x == 1):
				#velocity.x = dir_x * aceleration * delta
				#velocity.x = clamp(velocity.x, -max_speed, max_speed)
			#else:
				#velocity.x = move_toward(dir_x * velocity.x,0, aceleration * delta)
	move_and_slide()
	
#func _input(event):
	#if event.is_action_pressed("ui_accept"):
		#rotate(1.5708)
		
#func treat_vector(dir_x, dir_y):
	#var vector: Vector2
	#if (sin(rotation_degrees) == 0 ):
		#vector = Vector2(dir_x, 0)
	#if(cos(rotation_degrees)==0):
		#vector = Vector2(0, dir_y)
	#return vector
	
func rotate_cat():
	rotate(1.5708)
	
func input_handle(dir: Vector2) -> Vector2:
	if (sin(rotation_degrees) == 0):
		if ($Rays/RayCast2DLeft.is_colliding() || $Rays/RayCast2DRight.is_colliding() 
		|| !$Rays/RayCast2DLeftDown.is_colliding() || !$Rays/RayCast2DRightDown.is_colliding()):
			if (dir.y != 0):
				rotate_cat()
			return dir
		else:
			return dir * Vector2(1,0)
	else:
		if ($Rays/RayCast2DLeft.is_colliding() || $Rays/RayCast2DRight.is_colliding() 
		|| !$Rays/RayCast2DLeftDown.is_colliding() || !$Rays/RayCast2DRightDown.is_colliding()):
			if (dir.x != 0):
				rotate_cat()
			return dir
		else:
			return dir * Vector2(0,1)
	
	
func move(direction: Vector2, condition, delta):
	if(condition):
		velocity = velocity.move_toward(direction * max_speed, aceleration * delta)
		velocity = velocity.clamp(-Vector2(max_speed, max_speed), Vector2(max_speed, max_speed))
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

func raycast_move(direction: Vector2, dir_if_only_left_ray: Vector2, dir_if_only_right_ray: Vector2, delta):
	if($Rays/RayCast2DMiddle.is_colliding()):
		move(direction,(direction != Vector2.ZERO), delta)
	elif($Rays/RayCast2DLeftDown.is_colliding()):
			move(direction,(direction == dir_if_only_left_ray), delta)
	elif($Rays/RayCast2DRightDown.is_colliding()):
			move(direction,(direction == dir_if_only_right_ray), delta)
	
func degrees_move(direction: Vector2, delta):
	if(sin(rotation_degrees)==0 && cos(rotation_degrees)==1):
		raycast_move(direction, Vector2(-1,0), Vector2(1,0), delta)
		
	if(sin(rotation_degrees)==1 && cos(rotation_degrees)==0):
		raycast_move(direction, Vector2(0,-1), Vector2(0,1), delta)
		
	if(sin(rotation_degrees)==0 && cos(rotation_degrees)==-1):
		raycast_move(direction, Vector2(1,0), Vector2(-1,0), delta)
		
	if(sin(rotation_degrees)==-1 && cos(rotation_degrees)==0):
		raycast_move(direction, Vector2(0,1), Vector2(0,-1), delta)
