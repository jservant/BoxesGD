extends Node2D

onready var Grid = get_parent() # gets parent Tilemap
onready var iPos = (global_position)

"""
TODO:
	- Implement tile burning
	- Make burning work by decreasing the tile value every time the player moves.
	- Make tweening/animation work the way you want it (polish)
"""

func _process(_delta): #update
	
	global_position = lerp(global_position, iPos, _delta * 20) # movement lerp
	
	if Input.is_action_just_pressed("down"):
		check_then_move(Grid.world_to_map(iPos), iPos.x, iPos.y + 64)
	if Input.is_action_just_pressed("up"):
		check_then_move(Grid.world_to_map(iPos), iPos.x, iPos.y - 64)
	if Input.is_action_just_pressed("right"):
		check_then_move(Grid.world_to_map(iPos), iPos.x + 64, iPos.y)
	if Input.is_action_just_pressed("left"):
		check_then_move(Grid.world_to_map(iPos), iPos.x - 64, iPos.y)

func check_then_move(gridPos, cx, cy):
	var newGridPos = Grid.world_to_map(Vector2(cx, cy))
	print("newGridPos: ", newGridPos)
	print("old GridPos: ", gridPos)
	print("Tilemap value: ", Grid.get_cellv(newGridPos))
	if Grid.get_cellv(newGridPos) != -1: # if tile isn't empty, commit move
		iPos = Vector2(cx, cy)
		Grid.set_cell(gridPos.x, gridPos.y, 13)
