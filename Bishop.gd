extends "res://Figur.gd"


export (Texture) var texture


func _ready():
	$FigurSprite.texture = texture

func show_pass():
	board.select_curent_figur(self)
	var move_dir_north_right = Vector2(1,-1)
	var move_dir_north_left = Vector2(-1,-1)
	var move_dir_south_right = Vector2(1,1)
	var move_dir_south_left = Vector2(-1,1)
	var check_north_right = show_line_till_obstacle(move_dir_north_right)
	var check_north_left = show_line_till_obstacle(move_dir_north_left)
	var check_south_right = show_line_till_obstacle(move_dir_south_right)
	var check_south_left = show_line_till_obstacle(move_dir_south_left)
	show_hitted_cell(check_north_right)
	show_hitted_cell(check_north_left)	
	show_hitted_cell(check_south_right)	
	show_hitted_cell(check_south_left)		



		
