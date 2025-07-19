extends Node

var cat = "res://characters/cat/cat.tscn"

func degrees_move(direction: Vector2, delta):
	if(sin(cat.rotation_degrees)==0 && cos(cat.rotation_degrees)==1):
		raycast_move(direction, Vector2(-1,0), Vector2(1,0), delta)
		
	if(sin(cat.rotation_degrees)==1 && cos(cat.rotation_degrees)==0):
		raycast_move(direction, Vector2(0,-1), Vector2(0,1), delta)
		
	if(sin(cat.rotation_degrees)==0 && cos(cat.rotation_degrees)==-1):
		raycast_move(direction, Vector2(1,0), Vector2(-1,0), delta)
		
	if(sin(cat.rotation_degrees)==-1 && cos(cat.rotation_degrees)==0):
		raycast_move(direction, Vector2(0,1), Vector2(0,-1), delta)
