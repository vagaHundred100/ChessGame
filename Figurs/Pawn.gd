extends "res://Figur.gd"

export (Texture) var texture


func _ready():
	$FigurSprite.texture = texture


func show_pass():
	board.select_curent_figur(self)
	var move_dir = Vector2()
	var lighted_cells_number
	var next_distance_coord
	var hit_dir_left = Vector2()
	var hit_dir_right = Vector2()
	if is_start_pos:
		lighted_cells_number = 2
	else : 
		lighted_cells_number = 1
	if is_white:
		 move_dir = Vector2(0,1)
		 hit_dir_left = Vector2(1,1)
		 hit_dir_right = Vector2(-1,1)
	else :
		move_dir = Vector2(0,-1)
		hit_dir_left = Vector2(-1,-1)
		hit_dir_right = Vector2(1,-1)
	next_distance_coord = move_dir
	var coord = board.get_coordinates(global_position,next_distance_coord)
	var next_coord = coord
	if next_coord != null:
		for i in range(lighted_cells_number):
			board.light(next_coord)
			next_distance_coord += move_dir
			next_coord  = board.get_coordinates(global_position,next_distance_coord)
			if next_coord == null:
				break
	show_hitted_cell(hit_dir_left)
	show_hitted_cell(hit_dir_right)
	is_start_pos = false
	
	
	
	
