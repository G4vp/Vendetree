extends Node3D


var camrot_h = 0
var camrot_v = 0

var sens_h = 0.08
var sens_v = 0.08
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$h.rotation_degrees.y = camrot_h
	$h/v.rotation_degrees.x = camrot_v
func _input(event):
	camrot_v = clamp(camrot_v,-55, 30)
	
	if  event is InputEventMouseMotion && !Input.is_action_pressed("left_click"):
		camrot_h += -event.relative.x*sens_h
		camrot_v += event.relative.y*sens_v
