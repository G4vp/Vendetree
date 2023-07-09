extends Node3D

var lumber_jacks_count = 0
var mama_I_just_killed_a_man = false

func _process(delta):
	pass

func get_lumber_jacks_count():
	return lumber_jacks_count


func AxeEnteredArea(area):
	print(lumber_jacks_count)
	mama_I_just_killed_a_man = true
	lumber_jacks_count += 1
