extends Area2D


var is_white = true
var is_start_pos = true
var board
var is_selected = false
var just_moved = false
var deactivated = false


func _ready():
	board = get_parent()
	is_white = board.is_white(global_position)
	


func show_pass():
	pass


func show_line_till_obstacle(dir):
	var next_distance_coord = dir
	var coord = board.get_coordinates(global_position,next_distance_coord)
	while coord!= null:
		board.light(coord)
		next_distance_coord += dir
		coord = board.get_coordinates(global_position,next_distance_coord)
	return next_distance_coord


func show_hitted_cell(next_distance_coord):
	var hit_coord = board.is_hiting(global_position,next_distance_coord)
	if hit_coord!= null:
		board.Hitted_Cell(hit_coord)


func check_next_movble_dir(dir):
	var coord = board.get_coordinates(global_position,dir)
	if coord != null:
		board.light(coord)
	else:
		show_hitted_cell(dir)		


func deselect():
	is_selected = false


func deactivate():
	deactivated = true

func activate():
	deactivated = false


func set_to_new(pos):
	is_selected = false
	just_moved = true
	position = pos
			


func _on_Figur_mouse_entered():
	if not is_selected and not deactivated:
		$RedLight.show()


func _on_Figur_mouse_exited():
		$RedLight.hide()


func _on_Figur_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if !is_selected and !deactivated:
				if !just_moved:
					show_pass()
					$RedLight.hide()
					is_selected = true
				else : just_moved = false
			

			
