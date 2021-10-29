extends KinematicBody2D

onready var Server = get_node("/root/World/Server")
onready var world = get_node("/root/World")
onready var Protagonist = get_parent().get_parent()
onready var VerbGallery = get_parent().get_parent().get_node("VerbGallery")

var MaxSpeed = 500
var Acceleration = 2000
var Motion = Vector2.ZERO

var RealName = "Idea"
var Name = "Idea"
var Active = false

var animation = false

var link
var prevlink
var prevprevlink

func _ready():
	get_node("Sprite").playing=true

func _physics_process(delta):
	if Active == true:
		var axis = get_input_axis()
		if axis == Vector2.ZERO:
			apply_friction(Acceleration*delta)
		else:
			apply_movement(axis*Acceleration*delta)
		move_and_slide(Motion)
	else:
		var axis = Vector2.ZERO
		if axis == Vector2.ZERO:
			apply_friction(Acceleration*delta)
		else:
			apply_movement(axis*Acceleration*delta)
		move_and_slide(Motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	axis.y =  int(Input.is_action_pressed("ui_down"))-int(Input.is_action_pressed("ui_up"))
	return axis.normalized()

func apply_friction(amount):
	if Motion.length() > amount:
		Motion -= Motion.normalized()*amount
	else:
		Motion = Vector2.ZERO

func apply_movement(amount):
	Motion += amount
	if Motion.length() > MaxSpeed:
		Motion = Motion.normalized()*MaxSpeed



func _process(delta):
	#COLLISION WITH NOISE (FROM IDEA SIDE)
	#if get_parent().get_child_count()==1:
		#for i in range (0,get_slide_count(),1):
			#if get_slide_collision(i).collider!=null:
			#	if get_slide_collision(i).collider.RealName=="Noise":
		#			position.x = 200
		#			position.y = 200
			#		world.Protagonist.pass_turn()
			
	#if get_parent().get_child_count()>1:
	#	for i in range (0,get_slide_count(),1):
	#		if get_slide_collision(i).collider!=null:
	#			if get_slide_collision(i).collider.RealName=="Noise":
	#				var Ideas = get_parent()
	#				Ideas.remove_child(self)
	#				Ideas.get_parent().activate_idea(Ideas.get_child(0))
	#				self.queue_free()
	#				return
	
	# ANIMATIONS
	if animation==true:
		get_node("Sprite2").visible = true
		if get_node("Sprite2").modulate.a > 0:
			get_node("Sprite2").modulate.a -= 0.0080
		if get_parent().get_parent().addideatimer == 2:
			get_node("Sprite").playing = true
	else:
		get_node("Sprite").playing = false
		get_node("Sprite2").visible = false
		get_node("Sprite2").modulate.a = 1
	
	if Active==true and animation==false:
		get_node("Sprite").animation = "Active"
	elif Active==false and animation==false:
		get_node("Sprite").animation = "Normal"
	
	#MANAGE LINKS
	get_node("Label").text = Name
	if Protagonist.get_node("VerbGallery").getverb(get_node("Input").text.strip_edges(true, true))!=null:
		Name = "Verb"
	update()
	if Name=="Verb":
		var linkcheck = false
		for i in range(0,get_parent().get_child_count(),1):
			if get_parent().get_child(i)==prevlink:
				prevlink.link = null
				prevlink = null
			if get_parent().get_child(i)==prevprevlink:
				prevprevlink.link = null
				prevprevlink = null
			if link == get_parent().get_child(i):
				linkcheck = true
		if linkcheck == false:
			link = null
		prevlink = null
		prevprevlink = null
		if VerbGallery.getverb_array(get_node("Input").text.strip_edges(true, true))!=null:
			if VerbGallery.getverb_array(get_node("Input").text.strip_edges(true, true))[2]=="." and get_parent().currentverb==null:
				get_parent().currentverb = self
			if VerbGallery.getverb_array(get_node("Input").text.strip_edges(true, true))[2]!=".":
				for i in range (0, get_parent().get_child_count(),1):
					if get_parent().get_child(i)!=self and get_parent().get_child(i).Name!="Verb":
						var distance = get_parent().get_child(i).global_position.distance_to(global_position)
						if(distance<=250): 
							if get_parent().currentverb==null:
								get_parent().currentverb = self
							if get_parent().currentverb.link==null:
								get_parent().currentverb = self
							if get_parent().currentverb!=self and get_parent().currentverb.link!=null:
								if distance < get_parent().currentverb.global_position.distance_to(get_parent().currentverb.link.global_position):
									get_parent().currentverb.link = null
									get_parent().currentverb = self
							if get_parent().currentverb==self:
								if link==null and get_parent().get_child(i).prevlink==null:
									link = get_parent().get_child(i)
								elif link!=null and get_parent().get_child(i).prevlink==null:
									if distance < link.global_position.distance_to(global_position):
										link = get_parent().get_child(i)
								elif link==null and get_parent().get_child(i).prevlink!=null:
									if distance < get_parent().get_child(i).prevlink.global_position.distance_to(get_parent().get_child(i).global_position):
										link = get_parent().get_child(i)
										get_parent().get_child(i).prevlink.link = null
								elif link!=null and get_parent().get_child(i).prevlink!=null:
									if distance < link.global_position.distance_to(global_position) and distance < get_parent().get_child(i).prevlink.global_position.distance_to(get_parent().get_child(i).global_position):
											link = get_parent().get_child(i)
											get_parent().get_child(i).prevlink.link = null
						else:
							if link == get_parent().get_child(i):
								link = null
								get_parent().currentverb = null
						if get_parent().currentverb!=self:
							link = null
		if link!=null:
			if link.Name=="Verb":
				link = null
	else:
		var check1 = false
		var check2 = false
		for i in range (0, get_parent().get_child_count(),1):
			if get_parent().get_child(i)!=self and get_parent().get_child(i).link!=null:
				if get_parent().get_child(i).link==self:
					if get_parent().currentverb!=null:
						if get_parent().currentverb.link!=null:
							if VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))!=null:
								if (get_parent().currentverb==get_parent().get_child(i) and VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))[2]!=".")or(get_parent().currentverb.link==get_parent().get_child(i) and VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))[3]!="."):
									prevlink = get_parent().get_child(i)
									check1 = true
									for j in range (0,get_parent().get_child_count(),1):
										if get_parent().get_child(j)!=prevlink and get_parent().get_child(j).link!=null:
											if get_parent().get_child(j).link==prevlink:
												if (get_parent().currentverb.link==get_parent().get_child(j) and VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))[3]!="."):
													prevprevlink = get_parent().get_child(j)
													check2 = true
													for k in range (0,get_parent().get_child_count(),1):
														if get_parent().get_child(k)!=prevprevlink and get_parent().get_child(k).link!=null:
															if get_parent().get_child(k).link==prevprevlink:
																link = null
																prevlink = null
																prevprevlink = null
		if check1 == false:
			if prevlink!=null:
				for i in range(0,get_parent().get_child_count(),1):
					if get_parent().get_child(i)==prevlink:
						prevlink.link = null
			prevlink = null
		if check2 == false:
			if prevprevlink!=null:
				for i in range(0,get_parent().get_child_count(),1):
					if get_parent().get_child(i)==prevprevlink:
						prevlink.link = null
						prevlink = null
			prevprevlink = null

		if prevlink==null:
			link = null
			prevprevlink = null
		
		if prevlink!=null and prevprevlink==null:
			if VerbGallery.getverb_array(prevlink.get_node("Input").text.strip_edges(true, true))!=null:
				if VerbGallery.getverb_array(prevlink.get_node("Input").text.strip_edges(true, true))[3]!=".":
					for i in range (0, get_parent().get_child_count(),1):
						if get_parent().get_child(i)!=self and get_parent().get_child(i).link!=self and get_parent().get_child(i).Name!="Verb":
							var distance = get_parent().get_child(i).global_position.distance_to(global_position)
							if(distance<=250): 
								if link==null and get_parent().get_child(i).prevlink==null:
									link = get_parent().get_child(i)
								elif link!=null and get_parent().get_child(i).prevlink==null:
									if distance < link.global_position.distance_to(global_position):
										link = get_parent().get_child(i)
								elif link==null and get_parent().get_child(i).prevlink!=null:
									if distance < get_parent().get_child(i).prevlink.global_position.distance_to(get_parent().get_child(i).global_position):
										link = get_parent().get_child(i)
										get_parent().get_child(i).prevlink.link = null
								elif link!=null and get_parent().get_child(i).prevlink!=null:
									if distance < link.global_position.distance_to(global_position) and distance < get_parent().get_child(i).prevlink.global_position.distance_to(get_parent().get_child(i).global_position):
											link = get_parent().get_child(i)
											get_parent().get_child(i).prevlink.link = null
							else:
								if link == get_parent().get_child(i):
									link = null
	
	if Protagonist.get_node("VerbGallery").getverb(get_node("Input").text.strip_edges(true, true))!=null:
		Name = "Verb"
	elif get_parent().currentverb!=null:
		if prevlink!=null:
			if get_parent().currentverb==prevlink:
				if VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))[2]=="":
					Name = "Objective"
				else:
					Name = VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))[2]
			elif get_parent().currentverb.link==prevlink:
				if VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))[3]=="":
					Name = "Objective"
				else:
					Name = VerbGallery.getverb_array(get_parent().currentverb.get_node("Input").text.strip_edges(true, true))[3]
			elif (get_node("Input").text.strip_edges(true, true)!=""):
				Name = "Concept"
			else:
				Name = "Idea"
		elif (get_node("Input").text.strip_edges(true, true)!=""):
			Name = "Concept"
		else:
			Name = "Idea"
	elif (get_node("Input").text.strip_edges(true, true)!=""):
		Name = "Concept"
	else:
		Name = "Idea"

func _draw():
	if link !=null:
		var checklink = false
		for i in range (0,get_parent().get_child_count(),1):
			if get_parent().get_child(i)==link:
				checklink = true
		if checklink == true:
			draw_line(Vector2(0,0), link.global_position-self.global_position, Color(255, 0, 0), 5)

func _input(event):
	if Input.is_key_pressed(KEY_SPACE) and Active==true and get_parent().get_parent().acceptnewidea==true and world.get_node("WorldDescription").initiate==true:
		animation = true
		get_node("Sprite").animation = "NewIdeaAnim"
	else:
		animation = false
