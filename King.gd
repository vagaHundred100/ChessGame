extends "res://Figur.gd"


export (Texture) var texture


func _ready():
	$FigurSprite.texture = texture


func show_pass():
	board.select_curent_figur(self)
	var dir = Vector2(0,-1)
	for i in range(8):
		check_next_movble_dir(dir)
		dir = dir.rotated(PI/4).round()