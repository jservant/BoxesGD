extends Node2D

onready var Grid = get_parent() # gets parent Tilemap
onready var iPos = (global_position)
var allTiles = []
var touchedTiles = []
var ded = false

"""
TODO:
	- Make tweening/animation work the way you want it (polish)
"""

func _process(_delta): #update
	
	global_position = lerp(global_position, iPos, _delta * 20) # movement lerp
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("down"):
		check_then_move(Grid.world_to_map(iPos), iPos.x, iPos.y + 64)
	if Input.is_action_just_pressed("up"):
		check_then_move(Grid.world_to_map(iPos), iPos.x, iPos.y - 64)
	if Input.is_action_just_pressed("right"):
		check_then_move(Grid.world_to_map(iPos), iPos.x + 64, iPos.y)
	if Input.is_action_just_pressed("left"):
		check_then_move(Grid.world_to_map(iPos), iPos.x - 64, iPos.y)

func check_then_move(gridPos, cx, cy):
	if (ded): return
	var newGridPos = Grid.world_to_map(Vector2(cx, cy))
	if Grid.get_cellv(newGridPos) != -1: # if tile isn't empty, commit move
		if Grid.get_cellv(gridPos) == 0: # if tile is black square
			touchedTiles.push_back(Vector3(gridPos.x, gridPos.y, 6)) # add tile that was touched to array
			print("Length of touched tiles: ", touchedTiles.size()) 
		iPos = Vector2(cx, cy) # move to new tile
		for tile in range(0, touchedTiles.size()):
			touchedTiles[tile].z = int(touchedTiles[tile].z) - 1
			if (touchedTiles[tile].z == 0): 
				Grid.set_cellv(Vector2(touchedTiles[tile].x, touchedTiles[tile].y), -1)
				touchedTiles.erase(tile)
			elif (touchedTiles[tile].z == 1):  Grid.set_cellv(Vector2(touchedTiles[tile].x, touchedTiles[tile].y), 8)
			elif (touchedTiles[tile].z == 2):  Grid.set_cellv(Vector2(touchedTiles[tile].x, touchedTiles[tile].y), 9)
			elif (touchedTiles[tile].z == 3):  Grid.set_cellv(Vector2(touchedTiles[tile].x, touchedTiles[tile].y), 10)
			elif (touchedTiles[tile].z == 4):  Grid.set_cellv(Vector2(touchedTiles[tile].x, touchedTiles[tile].y), 11)
			elif (touchedTiles[tile].z == 5):  Grid.set_cellv(Vector2(touchedTiles[tile].x, touchedTiles[tile].y), 12)
			elif (touchedTiles[tile].z == 6):  Grid.set_cellv(Vector2(touchedTiles[tile].x, touchedTiles[tile].y), 13)
		if (Grid.get_cellv(newGridPos) == -1):
			ded = true
			$Sprite.visible = not $Sprite.visible
			print("you ded lol")
		if (Grid.get_used_cells_by_id(0).size() < 2):
			print("you did it woo")
