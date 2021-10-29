extends Node

onready var Server = get_parent().get_node("Server")
var Name = "EnemyGallery"

func _ready():
	pass # Replace with function body.

func generate_npc1():
	#create box
	var object = load("res://Scenes/Object.tscn")
	var body = object.instance()
	body.RealName = ["Your body","body","your body","my body","me","myself"]
	body.GeneralDescription = "A regular body"
	body.Structure = 6
	body.Size = 3
	#create box parts
	var Head = get_parent().generatepart(["Your head","head","your head","my head","forehead"],"It's just your head",1,1,7,3,"soft","bitter","sweaty","flesh")
	var Chest = get_parent().generatepart(["Your chest","chest","your chest","my chest"],"It's just your chest",1,1,7,3,"soft","bitter","sweaty","flesh")
	var RightArm = get_parent().generatepart(["Your right arm","right arm","your right arm","my right arm","arm","arms"],"It's just your right arm",1,1,7,3,"soft","bitter","sweaty","flesh")
	var LeftArm = get_parent().generatepart(["Your left arm","left arm","your left arm","my left arm","arm","arms"],"It's just your left arm",1,1,7,3,"soft","bitter","sweaty","flesh")
	var RightLeg = get_parent().generatepart(["Your right leg","right leg","your right leg","my right leg","leg","legs"],"It's just your right leg",1,1,7,3,"soft","bitter","sweaty","flesh")
	var LeftLeg = get_parent().generatepart(["Your left leg","left leg","your left leg","my left leg","leg","legs"],"It's just your left leg",1,1,7,3,"soft","bitter","sweaty","flesh")
	#Allocate parts in box
	body.add_child(RightArm)
	body.add_child(LeftArm)
	body.add_child(Head)
	body.add_child(Chest)
	body.add_child(RightLeg)
	body.add_child(LeftLeg)
	#Return
	return body

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
