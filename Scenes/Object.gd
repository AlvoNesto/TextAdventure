extends Node

onready var world = get_node("/root/World")
onready var Protagonist = get_node("/root/World/Protagonist")

var Name = "Object"
var Type
var RealName
var GeneralDescription
var Structure
var Size

var ExtraSize = 0

var on_object = false
var NPCbody = false
var partowner = "none"

var openable = "none"
var stack = "none"
var climbed = false

func _ready():
	pass

func _process(delta):
	var checkifbase = false
	for i in range (0,get_child_count(),1):
		if get_child(i).stack=="ontop":
			checkifbase = true
	if stack!="ontop" and checkifbase == false:
		stack = "none"
	elif checkifbase == true:
		stack=="base"
	if get_parent().Name=="Object" or get_parent().Name=="Part":
		if stack=="base" and get_parent().stack=="base":
			for i in range (0,get_child_count(),1):
				if get_child(i).stack=="ontop":
					var movedthing = get_child(i)
					remove_child(movedthing)
					get_parent().add_child(movedthing)
			stack="ontop"
		elif get_parent().stack=="base":
			stack="ontop"

func check_objdestruction(parts):
	if Structure<=0:
		#var parts = get_children()
		for i in range (0,parts.size(),1):
			if parts[i].durability>0:
				parts[i].on_object = false
				parts[i].stack = "none"
				remove_child(parts[i])
				Protagonist.get_parent().add_child(parts[i])
			elif parts[i].durability<=0:
				world.get_node("Result").text += (parts[i].RealName[0]+" got destroyed. ")
				parts[i].queue_free()
		world.get_node("Result").text += (RealName[0]+" got destroyed into pieces. ")
		if climbed==true:
			climbed=false
			Protagonist.get_node("Physicality").get_child(0).ExtraSize=0
			world.get_node("Result").text += " You falled down. "
		if stack=="base":
			world.get_node("Result").text += " Things that were on top of it got scattered into the floor. "
		queue_free()
	if Structure>0:
		#var parts = get_children()
		for i in range (0,parts.size(),1):
			if parts[i].durability<=0 and parts[i].bodyweakspot==false:
				world.get_node("Result").text += (parts[i].RealName[0]+" got destroyed. ")
				Protagonist.get_node("Body_Sprites").check_bodypart(parts[i])
				parts[i].queue_free()
			#Destroy NPC body
			if parts[i].durability<=0 and parts[i].bodyweakspot==true and parts[i].nodeowner.get_parent().get_parent().Name=="NPC":
				world.get_node("Result").text += (parts[i].RealName[0]+" got destroyed. You killed him. His corpse banished. ")
				if parts[i].get_parent().get_parent()==Protagonist:
					parts[i].queue_free()
				parts[i].nodeowner.get_parent().get_parent().queue_free()
			#Destroy you (game over)
			if parts[i].durability<=0 and parts[i].bodyweakspot==true and parts[i].get_parent().get_parent().get_parent().Name=="Protagonist":
				world.get_node("Result").text += (parts[i].RealName[0]+" got destroyed. You died. ")
				world.get_node("WorldDescription").gameover = true
				Protagonist.get_node("Body_Sprites").get_node("Head").visible = false
				Protagonist.get_node("Body_Sprites").get_node("Chest").visible = false
				Protagonist.get_node("Body_Sprites").get_node("LeftArm").visible = false
				Protagonist.get_node("Body_Sprites").get_node("RightArm").visible = false
				Protagonist.get_node("Body_Sprites").get_node("LeftLeg").visible = false
				Protagonist.get_node("Body_Sprites").get_node("RightLeg").visible = false
				Protagonist.get_node("Ideas").get_child(0).queue_free()
				#Protagonist.queue_free()
	return
