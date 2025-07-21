extends Node2D

@onready var down = $RayCast2DDown
@onready var left = $RayCast2DLeft
@onready var right = $RayCast2DRight
@onready var up = $RayCast2DUp

func is_horizontal() -> bool :
	return down.is_colliding() or up.is_colliding()
	
func is_vertical() -> bool:
	return right.is_colliding() or left.is_colliding()
