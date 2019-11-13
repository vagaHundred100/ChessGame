extends "res://Figur.gd"


export (Texture) var texture


func _ready():
	$FigurSprite.texture = texture


func show_pass():
	board.select_curent_figur(self)
	var first_square_corner = Vector2(2,-1)
	var second_square_corner = Vector2(1,-2)
	var diagonal_dir_change = Vector2(-1,1)
	var vertical_dir_change = Vector2(1,-1)
	for i in range(4):
		check_next_movble_dir(first_square_corner)
		check_next_movble_dir(second_square_corner)
		if i % 2 == 0:
			first_square_corner *= diagonal_dir_change
			second_square_corner *= diagonal_dir_change
		else:
			first_square_corner *= vertical_dir_change
			second_square_corner *= vertical_dir_change
