extends Node2D

onready var Grid = get_parent() # gets parent Tilemap
onready var iPos = (global_position)

"""
TODO:
	- Fix bump function
	- Find a way to make walls work. Try to avoid obstacles like the tutorial and instead do a ray cast
	or something to bump like in the original
	- Make tweening/animation work the way you want it (polish)
"""

func _process(_delta): #update
	
	global_position = lerp(global_position, iPos, _delta * 20)
	
	if Input.is_action_just_pressed("down"):
		check_then_move(iPos.x, iPos.y + 64)
	if Input.is_action_just_pressed("up"):
		check_then_move(iPos.x, iPos.y - 64)
	if Input.is_action_just_pressed("right"):
		check_then_move(iPos.x + 64, iPos.y)
	if Input.is_action_just_pressed("left"):
		check_then_move(iPos.x - 64, iPos.y)

func check_then_move(cx, cy):
	var gridPos = Grid.world_to_map(Vector2(cx, cy))
	print("gridPos: ", gridPos)
	print("Tilemap value: ", Grid.get_cellv(gridPos))
	if Grid.get_cellv(gridPos) != -1:
		iPos = Vector2(cx, cy)
