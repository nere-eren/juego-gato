extends Node

func raycast_move(direction: Vector2, dir_if_only_left_ray: Vector2, dir_if_only_right_ray: Vector2, delta):
	if($Rays/RayCast2DLeftDown.is_colliding() and $Rays/RayCast2DRightDown.is_colliding()):
		move(direction,(direction != Vector2.ZERO), delta)
	elif($Rays/RayCast2DLeftDown.is_colliding()):
			move(direction,(direction == dir_if_only_left_ray), delta)
	elif($Rays/RayCast2DRightDown.is_colliding()):
			move(direction,(direction == dir_if_only_right_ray), delta)
