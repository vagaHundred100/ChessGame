extends Node2D

func _ready():
	var dir = Vector2(0,-1)
	print(dir.rotated(PI/4).round())
