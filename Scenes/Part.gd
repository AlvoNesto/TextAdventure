extends Node

onready var world = get_node("/root/World")
onready var Protagonist = get_node("/root/World/Protagonist")

var Name = "Part"
var Type
var RealName
var Size
var Weight
var Maxdurability
var durability
var constitution
var GeneralDescription
var texture
var taste
var smell
var sound
var material
var structure = 1

var ExtraSize = 0

var on_object = true
var materialpower = 1
var kineticstate = 1

var bodyweakspot = false

var partowner = "none"
var nodeowner = null
var NPCbody = false

var openable = "none"
var stack = "none"
var climbed = false

func _ready():
	Protagonist.get_node("VerbGallery").connect("follow_ncpaction",self,"check_aliveobj_grabbed")

func check_aliveobj_grabbed():
	if partowner=="NPC" and get_parent().get_parent()==Protagonist:
		Protagonist.Stamina -= 30
		Protagonist.get_node("DescriptionPlus").text += "You are struggling to grab "+RealName[0]+". "
		#Enemy reaction if grabbed
		for i in range (0,nodeowner.get_parent().get_parent().knownthings.size(),1):
			if nodeowner.get_parent().get_parent().knownthings[i].Type=="you":
				if (nodeowner.get_parent().get_parent().selfcontrol==false)or(nodeowner.get_parent().get_parent().selfcontrol==true and nodeowner.get_parent().get_parent().knownthings[i].tolerance < 0):
					nodeowner.get_parent().get_parent().knownthings[i].tolerance -= 2
					nodeowner.get_parent().get_parent().knownthings[i].imageofyou -= 2
					nodeowner.get_parent().get_parent().knownthings[i].memory -= 1
					if nodeowner.get_parent().get_parent().knownthings[i].tolerance < 0:
						Protagonist.get_node("DescriptionPlus").text += nodeowner.RealName[0]+" is really angry with you. "
					elif nodeowner.get_parent().get_parent().knownthings[i].tolerance >= 0:
						Protagonist.get_node("DescriptionPlus").text += nodeowner.RealName[0]+" didn't like that but is open to forgive you. "
					if nodeowner.get_parent().get_parent().knownthings[i].memory == 0:
						Protagonist.get_node("DescriptionPlus").text += nodeowner.RealName[0]+" seems to have made his mind about you. "
				elif nodeowner.get_parent().get_parent().selfcontrol==true and nodeowner.get_parent().get_parent().knownthings[i].tolerance >= 0:
					nodeowner.get_parent().get_parent().knownthings[i].memory -= 1
					nodeowner.get_parent().get_parent().selfcontrol=false
					if nodeowner.get_parent().get_parent().knownthings[i].memory <= 0:
						Protagonist.get_node("DescriptionPlus").text += nodeowner.RealName[0]+" is shooked by your action but seems open to forgive you. He seems to have made his mind about you. "
					elif nodeowner.get_parent().get_parent().knownthings[i].memory > 0:
						Protagonist.get_node("DescriptionPlus").text += nodeowner.RealName[0]+" is shooked by your action but seems open to forgive you. "
				if Protagonist.Stamina<30:
					Protagonist.get_node("DescriptionPlus").text += RealName[0]+" got free from you. "
					get_parent().remove_child(self)
					nodeowner.add_child(self)
					nodeowner.move_child(self,0)

func _process(delta):
	if on_object == true:
		structure = nodeowner.Structure
	else:
		structure = 1
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
		elif get_parent().stack=="base" and ((partowner!="you" and get_parent().partowner!="you") and (partowner!="NPC" and get_parent().partowner!="NPC")):
			stack="ontop"

	if partowner=="NPC" and get_parent().get_parent()==Protagonist:
		if get_parent().get_parent().get_parent() != nodeowner.get_parent().get_parent().get_parent():
			var NPC = nodeowner.get_parent().get_parent()
			nodeowner.get_parent().get_parent().get_parent().remove_child(NPC)
			get_parent().get_parent().get_parent().add_child(NPC)
			Protagonist.get_node("DescriptionPlus").text += "You dragged him with you. "

func check_partdestruction():
	if durability<=0 and on_object==true:
		nodeowner.Structure -= 1
		var parts = nodeowner.get_children()
		if partowner=="NPC" and get_parent().get_parent()==Protagonist:
			parts.append(self)
		nodeowner.check_objdestruction(parts)
	elif durability<=0 and on_object == false:
		while (get_child_count()>0):
			var movething = get_child(0)
			movething.stack = "none"
			remove_child(movething)
			get_parent().add_child(movething)
		world.get_node("Result").text += (RealName[0]+" got destroyed. ")
		if climbed==true:
			climbed=false
			Protagonist.get_node("Physicality").get_child(0).ExtraSize=0
			world.get_node("Result").text += " You falled down. "
		if stack=="base":
			world.get_node("Result").text += " Things that were on top of it got scattered into the floor. "
		queue_free()
	return
