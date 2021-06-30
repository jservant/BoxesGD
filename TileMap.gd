extends TileMap

enum TileType { ACTOR, TILE }

func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.type)

# WIP FROM HERE DOWN. Continue here: https://youtu.be/9laHKHYNyXc?t=477
func get_cell_pawn(cell, type = TileType.ACTOR):
	for node in get_children():
		if node.type != type:
			continue
		if world_to_map(node.position) == cell:
			return(node)


func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction

	var cell_tile_id = get_cellv(cell_target)
	match cell_tile_id:
		-1:
			set_cellv(cell_target, TileType.ACTOR)
			set_cellv(cell_start, -1)
			return map_to_world(cell_target) + cell_size / 2
		TileType.OBJECT, TileType.ACTOR:
			var target_pawn = get_cell_pawn(cell_target, cell_tile_id)
			print("Cell %s contains %s" % [cell_target, target_pawn.name])
