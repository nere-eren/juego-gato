extends CharacterBody2D

@export var max_speed = 40000 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 8000 ## Aceleracion del jugador
@export var friction = 1 ## Friccion que se ejerce cunado el jugador deja de moverse

func move(direction: Vector2, delta):
	if(direction != Vector2.ZERO):
		velocity = velocity.move_toward(direction * max_speed, aceleration * delta)
		velocity = velocity.clamp(-Vector2(max_speed, max_speed), Vector2(max_speed, max_speed))
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	move_and_slide()
	
	
