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
	var move_dir_up = Vector2(0,-1)
	var move_dir_down = Vector2(0,1)
	var move_dir_left = Vector2(-1,0)
	var move_dir_right = Vector2(1,0)
	var check_north_right = show_line_till_obstacle(move_dir_north_right)
	var check_north_left = show_line_till_obstacle(move_dir_north_left)
	var check_south_right = show_line_till_obstacle(move_dir_south_right)
	var check_south_left = show_line_till_obstacle(move_dir_south_left)
	var check_up = show_line_till_obstacle(move_dir_up)
	var check_down = show_line_till_obstacle(move_dir_down)
	var check_left = show_line_till_obstacle(move_dir_left)
	var check_right = show_line_till_obstacle(move_dir_right)
	show_hitted_cell(check_north_right)
	show_hitted_cell(check_north_left)	
	show_hitted_cell(check_south_right)	
	show_hitted_cell(check_south_left)
	show_hitted_cell(check_up)
	show_hitted_cell(check_down)	
	show_hitted_cell(check_left)	
	show_hitted_cell(check_right)		



		

