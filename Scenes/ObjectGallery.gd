extends Node

onready var Server = get_parent().get_node("Server")
var Name = "ObjectGallery"

#BOX
func generate_box():
	#create box
	var object = load("res://Scenes/Object.tscn")
	var box = object.instance()
	box.Type = "box"
	box.RealName = ["Box","box","it","the box"]
	box.GeneralDescription = "a common wooden box"
	box.Structure = 1
	box.Size = 2
	box.openable = "close"
	#create box parts
	var Side1 = get_parent().generatepart("box part",["Box side","box side","it","the box side"],"a simple box side",1,1,1,1,"rough","bitter","old","none","wood")
	var Side2 = get_parent().generatepart("box part",["Box side","box side","it","the box side"],"a simple box side",1,1,1,1,"rough","bitter","old","none","wood")
	var Side3 = get_parent().generatepart("box part",["Box side","box side","it","the box side"],"a simple box side",1,1,1,1,"rough","bitter","old","none","wood")
	var Side4 = get_parent().generatepart("box part",["Box side","box side","it","the box side"],"a simple box side",1,1,1,1,"rough","bitter","old","none","wood")
	var Side5 = get_parent().generatepart("box part",["Box side","box side","it","the box side"],"a simple box side",1,1,1,1,"rough","bitter","old","none","wood")
	var Side6 = get_parent().generatepart("box part",["Box side","box side","it","the box side"],"a simple box side",1,1,1,1,"rough","bitter","old","none","wood")
	var Apple = get_parent().generatepart("apple",["Apple","apple","it","fruit","food"],"a simple apple",1,1,1,1,"soft","sweet","apple","none","organic")
	Side1.nodeowner = box
	Side2.nodeowner = box
	Side3.nodeowner = box
	Side4.nodeowner = box
	Side5.nodeowner = box
	Side6.nodeowner = box
	Apple.nodeowner = box
	Apple.on_object = false
	#Allocate parts in box
	box.add_child(Side1)
	box.add_child(Side2)
	box.add_child(Side3)
	box.add_child(Side4)
	box.add_child(Side5)
	box.add_child(Side6)
	box.add_child(Apple)
	#Return
	return box

func generate_floor():
	var Floor = get_parent().generateasset("floor",["Floor","floor","the floor"],"a really sturdy floor",1,"rock","rough","sour","rotten","none")
	return Floor
	
func generate_wall():
	var Wall = get_parent().generateasset("wall",["Wall","wall","the wall"],"a really sturdy wall",1,"rock","rough","sour","super rotten","none")
	return Wall

func generate_ceiling():
	var Ceiling = get_parent().generateasset("ceiling",["Ceiling","ceiling","the ceiling","roof","the roof"],"a really sturdy ceiling",5,"rock","rough","sour","rotten","none")
	return Ceiling

func generate_body():
	#create box
	var object = load("res://Scenes/Object.tscn")
	var body = object.instance()
	body.Type = "you"
	body.RealName = ["You","body","your body","my body","me","myself"]
	body.GeneralDescription = "a regular body"
	body.Structure = 6
	body.Size = 3
	body.partowner = "you"
	#create body parts
	var Head = get_parent().generatepart("you",["Your head","head","your head","my head","forehead"],"a simple head",1,1,7,3,"soft","bitter","sweaty","none","flesh")
	var Chest = get_parent().generatepart("you",["Your chest","chest","your chest","my chest"],"a simple chest",1,1,7,3,"soft","bitter","sweaty","none","flesh")
	var RightArm = get_parent().generatepart("you",["Your right arm","right arm","your right arm","my right arm","my arm","my arms","arm","arms"],"a simple right arm",1,1,7,3,"soft","bitter","sweaty","none","flesh")
	var LeftArm = get_parent().generatepart("you",["Your left arm","left arm","your left arm","my left arm","my arm","my arms","arm","arms"],"a simple left arm",1,1,7,3,"soft","bitter","sweaty","none","flesh")
	var RightLeg = get_parent().generatepart("you",["Your right leg","right leg","your right leg","my right leg","my leg","my legs","leg","legs"],"a simple right leg",1,1,7,3,"soft","bitter","sweaty","none","flesh")
	var LeftLeg = get_parent().generatepart("you",["Your left leg","left leg","your left leg","my left leg","my leg","my legs","leg","legs"],"a simple left leg",1,1,7,3,"soft","bitter","sweaty","none","flesh")
	Head.nodeowner = body
	Chest.nodeowner = body
	RightArm.nodeowner = body
	LeftArm.nodeowner = body
	RightLeg.nodeowner = body
	LeftLeg.nodeowner = body
	#Define Weakspots
	Head.partowner = "you"
	Chest.partowner = "you"
	RightArm.partowner = "you"
	LeftArm.partowner = "you"
	RightLeg.partowner = "you"
	LeftLeg.partowner = "you"
	Head.bodyweakspot = true
	Chest.bodyweakspot = true
	#Allocate parts in box
	body.add_child(RightArm)
	body.add_child(LeftArm)
	body.add_child(Head)
	body.add_child(Chest)
	body.add_child(RightLeg)
	body.add_child(LeftLeg)
	#Return
	return body

