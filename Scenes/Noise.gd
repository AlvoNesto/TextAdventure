extends KinematicBody2D

var RealName = "Noise"
var Name = "Noise"

onready var world = get_node("/root/World")

var movetimer = 0
var trajectory = Vector2.ZERO

var MaxSpeed = 40
var Acceleration = 2000
var Motion = Vector2.ZERO


func _ready():
	randomize()
	trajectory = Vector2(rand_range(-1,1),rand_range(-1,1)).normalized()

func _physics_process(delta):
	movetimer += 1
	if movetimer<100:
		apply_movement(trajectory*Acceleration*delta)
		move_and_slide(Motion)
	elif movetimer>=100 and movetimer<200:
		var Ideas = world.Protagonist.get_node("Ideas")
		for i in range (0,Ideas.get_child_count(),1):
			if Ideas.get_child(i).Active==true:
				trajectory = Vector2(Ideas.get_child(i).global_position.x-global_position.x,Ideas.get_child(i).global_position.y-global_position.y)
		apply_movement(trajectory*Acceleration*delta)
		move_and_slide(Motion)
	elif movetimer==200:
		movetimer=0
		randomize()
		trajectory = Vector2(rand_range(-1,1),rand_range(-1,1)).normalized()

func apply_movement(amount):
	Motion += amount
	if Motion.length() > MaxSpeed:
		Motion = Motion.normalized()*MaxSpeed

func _process(delta):
	#COLLISION WITH IDEA (FROM NOISE SIDE)
	var Ideas = world.Protagonist.get_node("Ideas")
	var checkcollision = false
	if Ideas.get_child_count()==1:
		if checkcollision==false:
			for i in range (0,get_slide_count(),1):
				if get_slide_collision(i).collider!=null:
					if get_slide_collision(i).collider.RealName=="Idea":
						position.x = 200
						position.y = 200
						world.Protagonist.pass_turn()
						checkcollision = true
		if checkcollision==false:
			for i in range (0,Ideas.get_child(0).get_slide_count(),1):
				if Ideas.get_child(0).get_slide_collision(i).collider!=null:
					if Ideas.get_child(0).get_slide_collision(i).collider==self:
						position.x = 200
						position.y = 200
						world.Protagonist.pass_turn()
						checkcollision = true
			
	if Ideas.get_child_count()>1:
		if checkcollision==false:
			for i in range (0,get_slide_count(),1):
				if get_slide_collision(i).collider!=null:
					if get_slide_collision(i).collider.RealName=="Idea":
						Ideas.remove_child(get_slide_collision(i).collider)
						get_slide_collision(i).collider.queue_free()
						world.Protagonist.activate_idea(Ideas.get_child(0))
						checkcollision = true
						return
		if checkcollision==false:
			for j in range (0,Ideas.get_child_count(),1):
				for i in range (0,Ideas.get_child(j).get_slide_count(),1):
					if Ideas.get_child(j).get_slide_collision(i).collider!=null:
						if Ideas.get_child(j).get_slide_collision(i).collider==self:
							var idea = Ideas.get_child(j)
							Ideas.remove_child(idea)
							Ideas.get_parent().activate_idea(Ideas.get_child(0))
							idea.queue_free()
							checkcollision = true
							return
