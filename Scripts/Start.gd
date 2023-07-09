extends Node3D

@onready var animation = $AnimationPlayer
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") || Input.is_action_just_pressed("ui_accept"):
		animation.play("ChangingScene")
		get_tree().change_scene_to_file("res://Scenes/TestLevel.tscn")
