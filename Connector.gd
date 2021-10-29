extends DampedSpringJoint2D

var ideaA
var ideaB
var angle
var size

func _ready():
	pass # Replace with function body.


func _process(delta):
	if ideaA!=null and ideaB!=null:
		position.x = ideaA.global_position.x
		position.y = ideaB.global_position.y
		angle = (atan2(ideaB.global_position.y-ideaA.global_position.y,ideaB.global_position.x-ideaA.global_position.x)*8)/(2*PI)
		if ideaB.global_position.y-ideaA.global_position.y<0 and ideaB.global_position.x-ideaA.global_position.x>0:
			rotation_degrees = -90+angle
		if ideaB.global_position.y-ideaA.global_position.y>0 and ideaB.global_position.x-ideaA.global_position.x>0:
			rotation_degrees = -90+angle
		if ideaB.global_position.y-ideaA.global_position.y<0 and ideaB.global_position.x-ideaA.global_position.x<0:
			rotation_degrees = 90+angle
		if ideaB.global_position.y-ideaA.global_position.y>0 and ideaB.global_position.x-ideaA.global_position.x<0:
			rotation_degrees = 90+angle
		size = sqrt((ideaB.global_position.x-ideaA.global_position.x)*(ideaB.global_position.x-ideaA.global_position.x)+(ideaB.global_position.y-ideaA.global_position.y)*(ideaB.global_position.y-ideaA.global_position.y))
		length = size


func connect_ideas(a,b):
	ideaA = a
	ideaB = b
