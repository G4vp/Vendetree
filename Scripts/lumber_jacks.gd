extends Node3D

@onready var pin_joint = $PinJoint3D2

@onready var character_body = $CharacterBody
@onready var lower_body = $LowerBody
@onready var upper_body = $UpperBody

var is_dead = false
func AreaEntered(_area):
	print(_area.name)
	if not is_dead:
		pin_joint.queue_free()
		
		var random_x = randi_range(3,7)
		var random_z = randi_range(3,7)
		var random_y = randi_range(1,3)
		var random_rotation = randi_range(2,20)
		
		switch_mesh()
		
		upper_body.apply_impulse(Vector3(-random_x+3,random_y,-random_z+3))
		lower_body.apply_impulse(Vector3(random_x,random_y,random_z))
		lower_body.rotate_z(random_rotation)
		
		is_dead = true

func switch_mesh():
	character_body.queue_free()
	upper_body.show()
	lower_body.show()
