extends Node3D

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("key_quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("key_restart"):
		get_tree().change_scene_to_file("res://Scenes/TestLevel.tscn")
	
		
