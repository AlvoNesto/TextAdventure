extends Node

var Name = "NPC"
var RealName
onready var world = get_node("/root/World")
onready var Server = get_node("/root/World/Server")
onready var Protagonist = get_node("/root/World/Protagonist")
onready var ObjectGallery = get_node("/root/World/ObjectGallery")

#Physical Stats
var Stamina = 100
var Focus = 100

var routine

#State
var state = "selfcentered" #violent, selfcentered, outcentered
var status = null
var status_timer = 0
var target = null

#Psychological Stats
var initial_tolerance = 0 #if positive or 0 non violent / if negative turn violent
var initial_imageofyou = 0 #if positive treat you good / if 0 neutral / if negative treat you bad
var initial_memory = 0 #number of reactions before making his mind about you
var initial_senseofhumour = false
var initial_selfcontrol = false
var initial_empathy = false
var initial_curiosity = false
var initial_sociability = false
var initial_pride = false

var tolerance = 0 #if positive or 0 non violent / if negative turn violent
var imageofyou = 0 #if positive treat you as intelligent / if 0 neutral / if negative treat you as fool
var memory = 0 #number of reactions before making his mind about you
var senseofhumour = false
var selfcontrol = false
var empathy = false
var curiosity = false
var sociability = false
var pride = false

#Other variables
var knownthings = []

#ROUTINE1
var act_routine1_neutral
var act_routine1_positive
var act_routine1_negative
#ROUTINE2
var act_routine2_neutral
var act_routine2_positive
var act_routine2_negative
#ROUTINE3
var act_routine3_neutral
var act_routine3_positive
var act_routine3_negative


func new_knownthings(node):
	var connection = load("res://Scenes/Connection.tscn")
	var NewConnection = connection.instance()
	NewConnection.node = node
	NewConnection.Type = node.Type
	NewConnection.memory = initial_memory
	NewConnection.tolerance = initial_tolerance
	NewConnection.imageofyou = initial_imageofyou
	NewConnection.last_memory = "He didn't know about it until now. "
	NewConnection.knowledge_about = node.GeneralDescription
	if node.RealName[1]=="generic":
		NewConnection.generic = true
	add_child(NewConnection)
	knownthings.append(NewConnection)
	return NewConnection

#func _process(delta):
#	print(knownthings.size())

func get_routine():
	# FIRST ACT
	if 1<=world.turn and world.turn<6 and imageofyou==0:
		routine = act_routine1_neutral
	elif 1<=world.turn and world.turn<6 and imageofyou>0:
		routine = act_routine1_positive
	elif 1<=world.turn and world.turn<6 and imageofyou<0:
		routine = act_routine1_negative
	# SECOND ACT
	elif 6<=world.turn and world.turn<11 and imageofyou==0:
		routine = act_routine2_neutral
	elif 6<=world.turn and world.turn<11 and imageofyou>0:
		routine = act_routine2_positive
	elif 6<=world.turn and world.turn<11 and imageofyou<0:
		routine = act_routine2_negative
	# THIRD ACT
	elif 11<=world.turn and imageofyou==0:
		routine = act_routine3_neutral
	elif 11<=world.turn and imageofyou>0:
		routine = act_routine3_positive
	elif 11<=world.turn and imageofyou<0:
		routine = act_routine3_negative
	return routine

func get_interactions():
	var Interactuablethings = []
	if get_parent().Name == "Server":
		#Inlude Rooms
		for i in range (0,get_parent().get_child_count(),1):
			if get_parent().get_child(i).Name != "Protagonist":
				Interactuablethings.append(get_parent().get_child(i).get_path())
	elif get_parent().Name == "Space":
		#Include Adjacent Spaces
		var currentplace = get_parent().Position
		for i in range (0,get_parent().get_parent().get_child_count(),1):
			if (get_parent().get_parent().get_child(i).Position==[currentplace[0]+1,currentplace[1]]) or \
			(get_parent().get_parent().get_child(i).Position==[currentplace[0]-1,currentplace[1]]) or \
			(get_parent().get_parent().get_child(i).Position==[currentplace[0],currentplace[1]+1]) or \
			(get_parent().get_parent().get_child(i).Position==[currentplace[0],currentplace[1]-1]):
				Interactuablethings.append(get_parent().get_parent().get_child(i).get_path())
		#Include Objects
		if get_parent().get_child_count()!=0:
			for i in range (0,get_parent().get_child_count(),1):
				if (get_parent().get_child(i).Name != "Protagonist")and(get_parent().get_child(i).Name != "NPC"):
					Interactuablethings.append(get_parent().get_child(i).get_path())
					#Include Parts
					if get_parent().get_child(i).get_child_count()!=0:
						for j in range (0,get_parent().get_child(i).get_child_count(),1):
							if get_parent().get_child(i).get_child(j).on_object==true:
								Interactuablethings.append(get_parent().get_child(i).get_child(j).get_path())
							elif get_parent().get_child(i).get_child(j).on_object==false and get_parent().get_child(i).openable=="open":
								Interactuablethings.append(get_parent().get_child(i).get_child(j).get_path())
				#Include People
				elif (get_parent().get_child(i).Name == "NPC" or get_parent().get_child(i).Name == "Protagonist"):
					if get_parent().get_child(i).get_node("Physicality").get_child_count()!=0:
						for j in range (0,get_parent().get_child(i).get_node("Physicality").get_child_count(),1):
							Interactuablethings.append(get_parent().get_child(i).get_node("Physicality").get_child(j).get_path())
							if get_parent().get_child(i).get_node("Physicality").get_child(j).get_child_count()!=0:
								for k in range (0,get_parent().get_child(i).get_node("Physicality").get_child(j).get_child_count(),1):
									Interactuablethings.append(get_parent().get_child(i).get_node("Physicality").get_child(j).get_child(k).get_path())
	return Interactuablethings

func move_protagonist(place):
	get_parent().remove_child(self)
	Server.get_child(0).get_node(place).add_child(self)

func _ready():
	Protagonist.connect("preturn",self,"get_state")
	Protagonist.get_node("VerbGallery").connect("follow_ncpaction",self,"update_status")

func update_status():
	if status=="toppled":
		status_timer+=1
		if status_timer>=4:
			status_timer=0
			status=null
	if status=="vulnerable" or status=="having a laugh attack":
		status_timer+=1
		if status_timer>=2:
			status_timer=0
			status=null
	if status=="offended" or status=="expectingthanks" or status=="expectingyesorno" or status=="expectingcontinuation":
		status_timer+=1
		if status_timer>=2:
			status_timer=0
			status=null

func get_state():
	if status==null and Stamina < 30:
		state="tired"
		target=null
	if status==null and Stamina >= 30:
		for i in range (0,knownthings.size(),1):
			if knownthings[i].tolerance<0:
				state="violent"
				var things=Protagonist.get_interactions()
				for j in range (0,things.size(),1):
					if knownthings[i].Type==get_node(things[j]).Type:
						if get_node(things[j]).Name=="Part":
							target = get_node(things[j]).get_parent()
						else:
							target = get_node(things[j])
	if status==null and state!="violent" and state!="tired":
		state="selfcentered"
		target=null
	if status=="toppled":
		state="immobilized"
		target=null
	if status=="vulnerable" or status=="having a laugh attack":
		state="immobilized"
		target=null
	if status=="offended" or status=="expectingthanks" or status=="expectingyesorno" or status=="expectingcontinuation":
		state="expectingresponse"
	if status=="depressed":
		state="innactive"

func send_action():
	var action
	if state=="violent":
		action=["Incoming attack",get_node("Physicality").get_child(0),get_node("Physicality").get_child(0).get_child(0),target]
	elif state=="tired":
		action=["Rest",get_node("Physicality").get_child(0),get_node("Physicality").get_child(0).RealName[0]+" seems to be out of stamina. "]
	elif state=="selfcentered":
		action=["Routine",get_node("Physicality").get_child(0),get_routine()]
	elif state=="immobilized":
		action=["Immobilized",get_node("Physicality").get_child(0),get_node("Physicality").get_child(0).RealName[0]+" is "+status+". "]
	elif state=="expectingresponse":
		action=["Expecting response",get_node("Physicality").get_child(0),get_node("Physicality").get_child(0).RealName[0]+" is looking at "+target.RealName[0]+" waiting for your follow up. "]
	elif state=="innactive":
		action=["Innactive",get_node("Physicality").get_child(0),get_node("Physicality").get_child(0).RealName[0]+" is "+status+". "]
	return action
