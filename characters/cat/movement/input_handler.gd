class_name InputHandler extends Node

@onready var cat = $"."

func _physics_process(delta):
	var dir = Input.get_vector("left","right","up","down")
	if (sin(cat.rotation_degrees) == 0):
		if (!$Rays/RayCast2DLeft.is_colliding() || !$Rays/RayCast2DRight.is_colliding() 
		|| $Rays/RayCast2DLeftDown.is_colliding() || $Rays/RayCast2DRightDown.is_colliding()):
			dir = dir * Vector2(1,0)
	else:
		if (!$Rays/RayCast2DLeft.is_colliding() || !$Rays/RayCast2DRight.is_colliding() 
		|| $Rays/RayCast2DLeftDown.is_colliding() || $Rays/RayCast2DRightDown.is_colliding()):
			dir = dir * Vector2(0,1)
			 
			
func _input(event):
	if (event.is_action("up")):
		if $Rays/RayCast2DLeft.is_colliding():
			cat.inside_rotate(1.5708)
		if $Rays/RayCast3DRight.is_colliding():
			cat.inside_rotate(-1.5708)
	
			
func handle_input(dir: Vector2) -> Vector2:
	if (sin(cat.rotation_degrees) == 0):
		if ($Rays/RayCast2DLeft.is_colliding() || $Rays/RayCast2DRight.is_colliding() 
		|| !$Rays/RayCast2DLeftDown.is_colliding() || !$Rays/RayCast2DRightDown.is_colliding()):
			if (dir.y != 0):
				cat.rotate_cat()
			return dir
		else:
			return dir * Vector2(1,0)
	else:
		if ($Rays/RayCast2DLeft.is_colliding() || $Rays/RayCast2DRight.is_colliding() 
		|| !$Rays/RayCast2DLeftDown.is_colliding() || !$Rays/RayCast2DRightDown.is_colliding()):
			if (dir.x != 0):
				cat.rotate_cat()
			return dir
		else:
			return dir * Vector2(0,1)
