extends Node2D


const BOARD_SIZE = 8
const CELL_SIZE = 80

var White_Figurs = {}
var Black_Figurs = {}
var board = []
var lighted_cells = {}
var curent_figur

var Lighted_Cell = preload("res://Cells/Lighted_CELL.tscn")
var RedInlight = preload("res://Cells/InLightedCell.tscn")
var Cell_Under_Hit = preload("res://Cells/Cell_Under_Hit.tscn")


func _ready():
	create_board()
	assign_board()


func create_board():
	for y in range(BOARD_SIZE):
		for x in range(BOARD_SIZE):
			White_Figurs[Vector2(x,y)] = null
			Black_Figurs[Vector2(x,y)] = null
			lighted_cells [Vector2(x,y)] = null


func assign_board():
	for figur in get_children():
		if figur is Area2D:
			var coord = pos_to_coord(figur.position)
			if coord.y < 3:
				White_Figurs[coord] = figur
			else :
				Black_Figurs[coord] = figur
				figur.deactivate()
	board  = [White_Figurs,Black_Figurs]


func is_white(pos):
	var coord = pos_to_coord(pos)
	if coord.y < 3:
		return true
	else :
		return false


func select_curent_figur(figur):
	if curent_figur!= null:
		curent_figur.deselect()
	curent_figur = figur
	var coord = pos_to_coord(figur.position)
	delight()
	inlight(coord)


func move_figur(pos):
	var previos_coord = pos_to_coord(curent_figur.position)
	var next_coord = pos_to_coord(pos) 
	for player in board:
		if player[previos_coord]!= null:
			player[next_coord] = player[previos_coord]
			player[previos_coord] = null
	curent_figur.set_to_new(pos)
	delight()
	deactivate()
	activate()


func hit(pos):
	var coord = pos_to_coord(pos)
	for player in board:
		if player[coord] != null:
			player[coord].queue_free()
			player[coord] = null
	move_figur(pos)


func deactivate():
	var curent_coord = pos_to_coord(curent_figur.position)
	for player in board:
		if player[curent_coord] != null:
			for figur in player:
				if player[figur] != null:
					player[figur].deactivate()				


func activate():
	var curent_coord = pos_to_coord(curent_figur.position)
	for player in board:
		if player[curent_coord] == null:
			for figur in player:
				if player[figur]!= null:
					player[figur].activate()


func light(coord):
	var cell = Lighted_Cell.instance()
	cell.position = coord * CELL_SIZE
	lighted_cells[coord] = cell
	add_child(cell)

func inlight(coord):
	var cell = RedInlight.instance()
	cell.position = coord * CELL_SIZE
	lighted_cells[coord] = cell
	add_child(cell)

func Hitted_Cell(coord):
	var cell = Cell_Under_Hit.instance()
	cell.position = coord * CELL_SIZE
	lighted_cells[coord] = cell
	add_child(cell)


func delight():
	for cell in lighted_cells:
		if lighted_cells[cell]!=null:
			lighted_cells[cell].queue_free()
			lighted_cells[cell] = null


func get_coordinates(pos,direction):
	var coord = pos_to_coord(pos)
	coord +=direction
	if is_out_of_border(coord):
		return null
	else:
		if is_ocupaide(coord):
			return null
	return coord


func is_hiting(pos,dir):
	var current_coord = pos_to_coord(curent_figur.position)
	var coord = pos_to_coord(pos) + dir
	if is_out_of_border(coord):
		return null
	for player in board:
		if player[current_coord] == null:
			if player[coord] != null:
				return coord
	return null	


func is_ocupaide(coord):
	if is_out_of_border(coord):
		return null
	for player in board:
			if player[coord] != null:
				return coord
	return null		


func pos_to_coord(pos):
	var coord = Vector2()
	coord.x  = int(pos.x / CELL_SIZE)
	coord.y = int(pos.y / CELL_SIZE)
	return coord


func is_out_of_border(pos):
	if pos.x < 0 or pos.y < 0:
		return true
	elif pos.x >= BOARD_SIZE or pos.y>= BOARD_SIZE:
		return true
	else : return false
	
	