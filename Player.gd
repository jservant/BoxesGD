extends "Pawn.gd"

onready var Grid = get_parent() # gets parent grid

"""
TODO:
	- Fix bump function
	- Find a way to make walls work. Try to avoid obstacles like the tutorial and instead do a ray cast
	or something to bump like in the original
	- Make tweening/animation work the way you want it (polish)
"""

func _process(_delta): #update
	var input_direction = get_input_direction()
	if not input_direction:
		return
	# update_look_direction(input_direction)

	var target_position = Grid.request_move(self, input_direction)
	if target_position:
		move_to(target_position)
		#$Tween.start()
	#else:
	#	bump()

func get_input_direction():
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

# does nothing without animation triggers I think
func update_look_direction(direction):
	$Pivot/Sprite.rotation = direction.angle()


func move_to(target_position):
	set_process(false)
	#$AnimationPlayer.play("walk")
	
	# Move the node to the target cell instantly
	# then animate the sprite moving from the start to the target tile
	# All animation stuff commented out for now
	var move_direction = (position - target_position).normalized()
	# make sure 32 on the next line is the size of a cell, or half idk yet
	#$Tween.interpolate_property($Pivot, "position", move_direction * 32, Vector2(), $AnimationPlayer.current_animation_length, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Pivot/Sprite.position = position - target_position
	position = target_position

	# Stop function execution until animation is finished
	# again commented for now for polish reasons tho it might break things
	#yield($AnimationPlayer, "animation_finished")

	set_process(true)


# func bump():
#	$AnimationPlayer.play("bump")
