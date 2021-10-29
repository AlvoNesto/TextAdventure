extends Node

onready var Protagonist = get_parent().get_node("Protagonist")
var currentevents = []
var roll

# Called when the node enters the scene tree for the first time.
func _ready():
	Protagonist.get_node("VerbGallery").connect("follow_ncpaction",self,"run_npcaction")
	Protagonist.get_node("VerbGallery").connect("follow_ncpaction",self,"enviromentevent")

func update_events():
	var array = Protagonist.get_interactions()
	currentevents = []
	for i in range (0,array.size(),1):
		if get_node(array[i]).Name=="Object":
			if get_node(array[i]).NPCbody==true:
				currentevents.append(get_node(array[i]).get_parent().get_parent().send_action())
	return currentevents


func update_eventdescription():
	get_node("Label_Event").text = ""
	for i in range (0,currentevents.size(),1):
		var event = currentevents[i]
		if event!=null:
			if event[0]=="Incoming attack":
				get_node("Label_Event").text += event[0]+" from "+event[1].RealName[0]+". "
			elif event[0]=="Routine" and (event[2] in get_parent().get_node("EnemyDescription").text)==false:
				get_parent().get_node("EnemyDescription").text += event[2]
			elif event[0]=="Rest" and (event[2] in get_parent().get_node("EnemyDescription").text)==false:
				get_parent().get_node("EnemyDescription").text += event[2]
			elif event[0]=="Immobilized" and (event[2] in get_parent().get_node("EnemyDescription").text)==false:
				get_parent().get_node("EnemyDescription").text += event[2]
			elif event[0]=="Expecting response" and (event[2] in get_parent().get_node("EnemyDescription").text)==false:
				get_parent().get_node("EnemyDescription").text += event[2]
			elif event[0]=="Innactive" and (event[2] in get_parent().get_node("EnemyDescription").text)==false:
				get_parent().get_node("EnemyDescription").text += event[2]
			if event[1].get_parent().get_parent().Stamina>=30 and event[1].get_parent().get_parent().Stamina<=60 and ("seems kinda tired." in get_parent().get_node("EnemyDescription").text)==false:
				get_parent().get_node("EnemyDescription").text += event[1].RealName[0]+" seems kinda tired. "
	if roll!=null:
		get_node("Label_Event").text += roll
	return

func run_npcaction():
	update_events()
	get_parent().get_node("EnemyDescription").text=""
	for i in range (0,currentevents.size(),1):
		var action = currentevents[i]
		if action != null:
			# INCOMING ATTACK
			if action[0]=="Incoming attack" and (action[1].Size+action[1].ExtraSize)>=(action[3].ExtraSize):
				action[1].get_parent().get_parent().Stamina -= 40
				var damage=get_parent().clash(action[2],action[3],1)
				get_parent().get_node("EnemyDescription").text+=action[1].RealName[0]+" attacked "+action[3].RealName[0]+" with "+action[2].RealName[0]+". "+str(damage[2])
			if action[0]=="Incoming attack" and (action[1].Size+action[1].ExtraSize)<(action[3].ExtraSize):
				action[1].get_parent().get_parent().Stamina -= 40
				get_parent().get_node("EnemyDescription").text+=action[1].RealName[0]+" couldn't reach his target. "
			# REST
			if action[0]=="Rest":
				action[1].get_parent().get_parent().Stamina += 50
				get_parent().get_node("EnemyDescription").text+=action[1].RealName[0]+" rested. "
	update_events()
	return

func _process(delta):
	if get_parent().get_node("WorldDescription").initiate==true and get_parent().get_node("WorldDescription").gameover==false:
		update_events()
		update_eventdescription()


func enviromentevent():
	var eventsarray = []
	var things = Protagonist.get_interactions()
	for i in range (0,things.size(),1):
		if get_node(things[i]).Name == "Asset":
			if Protagonist.getvalue_smell(get_node(things[i]).smell)>0:
				eventsarray.append("There is a very pleasant smell coming from "+get_node(things[i]).RealName[0]+" (you recovered some focus). ")
			elif Protagonist.getvalue_smell(get_node(things[i]).smell)<-1:
				eventsarray.append("There is a very disgusting smell coming from "+get_node(things[i]).RealName[0]+" (you lost some focus). ")
	if Protagonist.get_parent().Temperature>1:
		eventsarray.append("You started to sweat as this space feels super hot (you lost some focus) (your body temperature rised). ")
	elif Protagonist.get_parent().Temperature<-1:
		eventsarray.append("You started to tremble as this space feels super cold (you lost some focus) (your body temperature lowered). ")
	elif Protagonist.get_parent().Temperature==-1:
		eventsarray.append("This space feels quiet cold (your body temperature lowered). ")
	elif Protagonist.get_parent().Temperature==1:
		eventsarray.append("This space feeld quiet hot (your body temperature rised). ")
	if Protagonist.get_parent().Air>1:
		eventsarray.append("Super thin air is flowing through this space making breathing hard (you lost some focus). ")
	elif Protagonist.get_parent().Air<-1:
		eventsarray.append("Super heavy air is flowing through this space making breathing stressful (you lost some focus). ")
	elif Protagonist.get_parent().Air==-1:
		eventsarray.append("Heavy air is flowing through this space making breathing a little stressful (you can't focus properly). ")
	elif Protagonist.get_parent().Air==1:
		eventsarray.append("Thin air is flowing through this space making breathing a little hard (you can't focus properly). ")
	elif Protagonist.get_parent().Air==0:
		eventsarray.append("Fresh air is flowing through this space (you recovered some focus). ")
	randomize()
	roll = eventsarray[randi()%eventsarray.size()]
	if "(you lost some focus)" in roll:
		var luckroll = rand_range(0,1)
		if luckroll <= 0.5:
			roll = roll.replace("(you lost some focus)","(you can't focus properly)")
			Protagonist.Stamina += 5
		else:
			Protagonist.Stamina += 5
			Protagonist.Focus -= 5
	if "(you recovered some focus)" in roll:
		Protagonist.Stamina += 5
		Protagonist.Focus += 5
	if "(you can't focus properly)" in roll:
		Protagonist.Stamina += 5
	if "(your body temperature rised)" in roll:
		Protagonist.Temperature += 20
	if "(your body temperature lowered)" in roll:
		Protagonist.Temperature -= 20
	#Correlate temperature with focus
	if Protagonist.Temperature>=60:
		Protagonist.Focus -= 5
		roll+="Your body feels too hot (you lost some focus). "
	elif Protagonist.Temperature<=-60:
		Protagonist.Focus -= 5
		roll+="Your body feels too cold (you lost some focus). "
	#regulate protagonist body temperature
	if Protagonist.Temperature>=5:
		Protagonist.Temperature -= 5
	elif Protagonist.Temperature<=-5:
		Protagonist.Temperature += 5
	elif Protagonist.Temperature<5 and Protagonist.Temperature>0:
		Protagonist.Temperature = 0
	elif Protagonist.Temperature>-5 and Protagonist.Temperature<0:
		Protagonist.Temperature = 0
	return
