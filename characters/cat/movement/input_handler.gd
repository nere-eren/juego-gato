class_name InputHandler extends Node

var cat = "res://characters/cat/cat.tscn"
var next = 

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
