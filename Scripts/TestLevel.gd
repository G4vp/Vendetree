extends Node3D

@onready var time_label = $Labels/TimeLabel
@onready var remain_label = $Labels/RemainLabel
@onready var lumber_jacks_group = $LumberJacksGroup
@onready var player = $Player/mesh_tree_3d

var time_elapsed := 12000
var minutes
var seconds
var time_string



func _process(delta: float) -> void:
	stop_watch(delta)
	if player.mama_I_just_killed_a_man:
		player.mama_I_just_killed_a_man = false
		
		var lumber_jacks_count = lumber_jacks_group.get_children().size() - player.get_lumber_jacks_count() 
		var count_string = "%02d"%[lumber_jacks_count]
		remain_label.text = "Remains\n" + count_string
	
	if Input.is_action_just_pressed("key_quit"):
		get_tree().quit()
		
func stop_watch(delta):
	time_elapsed -= delta
	minutes = time_elapsed / 60
	seconds = fmod(time_elapsed, 60)
	time_string = "%02d:%02d" % [minutes, seconds]
	time_label.text = time_string

