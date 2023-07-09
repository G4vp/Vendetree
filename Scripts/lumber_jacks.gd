extends Node3D

@onready var pin_joint = $PinJoint3D2

@onready var lower_body = $LowerBody

@onready var upper_body = $UpperBody

var is_dead = false
func AreaEntered(area):
	if not is_dead:
		pin_joint.queue_free()
		
		var random_x = randi_range(3,7)
		var random_z = randi_range(3,7)
		var random_y = randi_range(1,3)
		var random_rotation = randi_range(2,20)
		
		
		upper_body.apply_impulse(Vector3(-random_x,random_y,-random_z))
		lower_body.apply_impulse(Vector3(random_x,random_y,random_z))
		upper_body.rotate_x(random_rotation)
		lower_body.rotate_z(random_rotation)
		
		is_dead = true
		
