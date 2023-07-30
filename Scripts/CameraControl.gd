extends Node3D


var camrot_h = 0
var camrot_v = 0

var sens_h = 0.7
var sens_v = 0.7
func _ready():
	pass

func _physics_process(_delta):
	$h.rotation_degrees.y = camrot_h
	$h/v.rotation_degrees.x = camrot_v
func _input(event):
	camrot_v = clamp(camrot_v,-55, 30)
	
	if  event is InputEventMouseMotion:
		camrot_h += -event.relative.x*sens_h
		camrot_v += event.relative.y*sens_v
