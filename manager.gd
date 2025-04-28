extends Node2D

onready var start = $StartSound
var hasStarted = false
onready var startingLad = 0
signal activateLad

func _process(delta):
	if Input.is_action_just_pressed("start") and hasStarted == false:
		start.play()
		hasStarted = true
		startingLad = 1
		var newLadObj = find_node("Lad"+str(startingLad))
		newLadObj.active = true
	if Input.is_action_just_pressed("restart") and hasStarted == true:
		get_tree().reload_current_scene()
		start.play()
		startingLad = 1
		var newLadObj = find_node("Lad"+str(startingLad))
		newLadObj.active = true

func _on_Lad_new_lad(ladNum):
	startingLad = ladNum + 1
	var newLadObj = find_node("Lad"+str(startingLad))
	newLadObj.active = true

func _on_Lad2_new_lad(ladNum):
	startingLad = ladNum + 1
	var newLadObj = find_node("Lad"+str(startingLad))
	newLadObj.active = true

func _on_Lad3_new_lad(ladNum):
	startingLad = ladNum + 1
	var newLadObj = find_node("Lad"+str(startingLad))
	newLadObj.active = true

func _on_Lad4_new_lad(ladNum):
	startingLad = ladNum + 1
	var newLadObj = find_node("Lad"+str(startingLad))
	newLadObj.active = true

func _on_Lad5_new_lad(ladNum):
	startingLad = ladNum + 1
	var newLadObj = find_node("Lad"+str(startingLad))
	newLadObj.active = true
	#newLadObj.clearLimit = 3

func _on_Lad6_new_lad(ladNum):
	startingLad = ladNum + 1
	var newLadObj = find_node("Lad"+str(startingLad))
	newLadObj.active = true
	#newLadObj.clearLimit = 3
