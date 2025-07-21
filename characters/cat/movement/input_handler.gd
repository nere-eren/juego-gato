class_name InputHandler extends Node

@onready var cat = $".."
@onready var rays = $"../Rays"

func _physics_process(delta):
	var dir = Input.get_vector("left","right","up","down")
	
	if(!rays.is_horizontal()):
		dir *= Vector2(0,1)
	if(!rays.is_vertical()):
		dir *= Vector2(1,0)
		
	if(dir.x != 0 and dir.y != 0):
		dir = dir * Vector2(0,1)
		
	cat.move(dir, delta)
			
			
			
#func _input(event):
	#if (event.is_action("up")):
		#if $Rays/RayCast2DLeft.is_colliding():
			#cat.inside_rotate(1.5708)
		#if $Rays/RayCast3DRight.is_colliding():
			#cat.inside_rotate(-1.5708)
	#
			#
#func handle_input(dir: Vector2) -> Vector2:
	#if (sin(cat.rotation_degrees) == 0):
		#if ($Rays/RayCast2DLeft.is_colliding() || $Rays/RayCast2DRight.is_colliding() 
		#|| !$Rays/RayCast2DLeftDown.is_colliding() || !$Rays/RayCast2DRightDown.is_colliding()):
			#if (dir.y != 0):
				#cat.rotate_cat()
			#return dir
		#else:
			#return dir * Vector2(1,0)
	#else:
		#if ($Rays/RayCast2DLeft.is_colliding() || $Rays/RayCast2DRight.is_colliding() 
		#|| !$Rays/RayCast2DLeftDown.is_colliding() || !$Rays/RayCast2DRightDown.is_colliding()):
			#if (dir.x != 0):
				#cat.rotate_cat()
			#return dir
		#else:
			#return dir * Vector2(0,1)
