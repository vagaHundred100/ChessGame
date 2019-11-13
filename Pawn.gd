extends "res://Figur.gd"


func show_pass():
	var move_dir = Vector2()
	var hit_dir_left = Vector2(-1,1)
	var hit_dir_right = Vector2(1,1)
	if is_white :
		move_dir = Vector2(0,1)
	else :
		move_dir = Vector2(0,-1)
		hit_dir_left *= -1
		hit_dir_right *= -1
	var coord = board.get_coordinate(global_position)
	if coord != null:
		board.light(coord)
	if board.is_hiting(coord):
		board.Hitted_Cell(coord)
	
