extends Node

onready var Server = get_parent().get_node("Server")
onready var Concept = get_node("/root/World/Protagonist/VerbGallery/Concept")
var Name = "NPCGallery"

func _ready():
	pass # Replace with function body.

func generate_pepe():
	#create npc
	var npc = load("res://Scenes/NPC.tscn")
	var pepe = npc.instance()
	pepe.initial_tolerance = 1
	pepe.initial_imageofyou = 0
	pepe.initial_memory = 3
	pepe.initial_senseofhumour = true
	pepe.initial_selfcontrol = true
	pepe.initial_empathy = false
	pepe.initial_curiosity = true
	pepe.initial_sociability = false
	pepe.initial_pride = true
	pepe.tolerance = 1
	pepe.imageofyou = 0
	pepe.memory = 3
	pepe.senseofhumour = true
	pepe.selfcontrol = true
	pepe.empathy = true
	pepe.curiosity = true
	pepe.sociability = false
	pepe.pride = true
	pepe.act_routine1_neutral = "Scientist is thinking. "
	pepe.act_routine1_positive = "Scientist is thinking. Despite his focus he seems to be peeking at you occasionally. "
	pepe.act_routine1_negative = "Scientist is thinking. He looks uncomfortable with you here. "
	pepe.act_routine2_neutral = "Scientist is scratching his head. "
	pepe.act_routine2_positive = "Scientist is scratching his head. Despite his focus he seems to be peeking at you occasionally. "
	pepe.act_routine2_negative = "Scientist is scratching his head. He looks uncomfortable with you here. "
	pepe.act_routine3_neutral = "Scientist looks happy about something. "
	pepe.act_routine3_positive = "Scientist looks happy about something. Despite his focus he seems to be peeking at you occasionally. "
	pepe.act_routine3_negative = "Scientist looks happy about something. He looks uncomfortable with you here. "
	#create his knowledge
	var newconcept 
	Concept.Type="box"
	newconcept = pepe.new_knownthings(Concept)
	newconcept.last_memory = "I found food inside one of those before. "
	newconcept.knowledge_about = "I think you can use it as a steping stone for reaching high places. "
	Concept.Type="dreams"
	newconcept = pepe.new_knownthings(Concept)
	newconcept.last_memory = "For now my only goal is to get out of here. "
	newconcept.knowledge_about = "I truly beleive that what gives us sanity in moments like this is to always be striving towards something. That's the power of dreams. "
	#create npc body
	var object = load("res://Scenes/Object.tscn")
	var body = object.instance()
	body.Type = "scientist"
	body.RealName = ["Scientist","scientist","person","his body","body","pepe","him"]
	body.GeneralDescription = "a really sturdy body except for the head. Is that because of stupidity?"
	body.Structure = 6
	body.Size = 3
	body.NPCbody = true
	body.partowner = "NPC"
	#create npc body parts
	var Head = get_parent().generatepart("scientist",["His head","his head","head","forehead","head of pepe","face","his face"],"a pretty weak head",1,1,10,2,"soft","bitter","sweaty","none","flesh")
	var Chest = get_parent().generatepart("scientist",["His chest","his chest","chest","chest of pepe"],"a pretty sturdy chest",1,1,10,4,"soft","bitter","sweaty","none","flesh")
	var RightArm = get_parent().generatepart("scientist",["His right arm","his right arm","right arm","right arm of pepe","his arm","arm","arms","his arms","his hand","his hands","hand"],"a pretty sturdy right arm",1,1,10,4,"soft","bitter","sweaty","none","flesh")
	var LeftArm = get_parent().generatepart("scientist",["His left arm","his left arm","left arm","left arm of pepe","his arm","his arms","arm","arms","his hand","his hands","hand"],"a pretty sturdy left arm",1,1,10,4,"soft","bitter","sweaty","none","flesh")
	var RightLeg = get_parent().generatepart("scientist",["His right leg","his right leg","right leg","right leg of pepe","his leg","his legs","leg","legs","his feet","feet"],"a pretty sturdy right leg",1,1,10,4,"soft","bitter","sweaty","none","flesh")
	var LeftLeg = get_parent().generatepart("scientist",["His left leg","his left leg","left leg","left leg of pepe","his leg","his legs","leg","legs","his feet","feet"],"a pretty sturdy left leg",1,1,10,4,"soft","bitter","sweaty","none","flesh")
	Head.nodeowner = body
	Chest.nodeowner = body
	RightArm.nodeowner = body
	LeftArm.nodeowner = body
	RightLeg.nodeowner = body
	LeftLeg.nodeowner = body
	#Define Weakspots & bodyparts
	Head.partowner = "NPC"
	Chest.partowner = "NPC"
	RightArm.partowner = "NPC"
	LeftArm.partowner = "NPC"
	RightLeg.partowner = "NPC"
	LeftLeg.partowner = "NPC"
	Head.bodyweakspot = true
	Chest.bodyweakspot = true
	#Allocate parts to body
	body.add_child(RightArm)
	body.add_child(LeftArm)
	body.add_child(Head)
	body.add_child(Chest)
	body.add_child(RightLeg)
	body.add_child(LeftLeg)
	#Allocate body to npc
	pepe.get_node("Physicality").add_child(body)
	#Return
	return pepe

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
