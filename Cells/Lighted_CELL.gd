extends Area2D


var board


func _ready():
	board = get_parent()
	

func _on_Lighted_CELL_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			board.move_figur(global_position)
