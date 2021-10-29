extends Node

var Name = "Protagonist"
onready var Server = get_node("/root/World/Server")
onready var ObjectGallery = get_node("/root/World/ObjectGallery")
onready var VerbGallery = get_node("VerbGallery")
onready var YourDescription = get_node("YourDescription")
onready var TextInput_Verb = get_node("TextInput_Verb")
onready var TextInput_Objective = get_node("TextInput_Objective")
onready var TextInput_Extra = get_node("TextInput_Extra")
onready var world = get_node("/root/World")
onready var EventManager = get_node("/root/World/EventManager")
onready var tutorial = get_node("/root/World/Tutorial")

signal initiate
signal preturn

var addideatimer = 0
var acceptnewidea = true

#Status
var status = null
var status_timer = 0

#Stats
var Stamina = 90
var Focus = 90
var Temperature = 0

var NewBody
# Called when the node enters the scene tree for the first time.
func _ready():
	NewBody=ObjectGallery.generate_body()
	get_node("Physicality").add_child(NewBody)

#tastes
var liked_tastes = ["sweet","salty"]
var disliked_tastes = ["sour","bitter"]
#smells
var liked_smells = ["clean","old","apple"]
var disliked_smells = ["dirty","sweaty","rotten"]
#sounds
var liked_sounds = []
var disliked_sounds = []
#textures
var liked_textures = ["soft","smooth"]
var disliked_textures = ["sticky","rough"]

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	#TO START
	if Input.is_key_pressed(KEY_ENTER) and just_pressed and world.get_node("WorldDescription").initiate==false:
		tutorial.introduction(0)
		world.get_node("WorldDescription").initiate = true
		activate_idea(get_node("Ideas").get_child(0))
		EventManager.enviromentevent()
		emit_signal("initiate")
	if Input.is_key_pressed(KEY_RIGHT) and just_pressed and world.get_node("WorldDescription").initiate==false and tutorial.currentpage>=1 and tutorial.currentpage<8:
		tutorial.currentpage += 1
		tutorial.introduction(tutorial.currentpage)
	if Input.is_key_pressed(KEY_LEFT) and just_pressed and world.get_node("WorldDescription").initiate==false and tutorial.currentpage>1 and tutorial.currentpage<=8:
		tutorial.currentpage -= 1
		tutorial.introduction(tutorial.currentpage)
	
	#MOMENT TO MOMENT
	if Input.is_key_pressed(KEY_SPACE) and world.get_node("WorldDescription").initiate==true:
		addideatimer += 1
		if addideatimer > 1 and 8 > addideatimer:         
			get_tree().set_input_as_handled()
		if addideatimer >= 8 and acceptnewidea==true:
			var Idea = load("res://Scenes/Idea.tscn")
			var NewIdea = Idea.instance()
			var prev_activeidea = get_active_idea()
			get_node("Ideas").add_child(NewIdea)
			activate_idea(NewIdea)
			if prev_activeidea.position.x<625:
				NewIdea.position.x = prev_activeidea.position.x+300-Focus
				NewIdea.position.y = prev_activeidea.position.y+1
			else:
				NewIdea.position.x = prev_activeidea.position.x-300+Focus
				NewIdea.position.y = prev_activeidea.position.y+1
			addideatimer = 0
			acceptnewidea = false
		elif addideatimer >= 8 and acceptnewidea==false:
			get_tree().set_input_as_handled()
	else:
		addideatimer = 0
		acceptnewidea = true
	
	if Input.is_key_pressed(KEY_ENTER) and just_pressed  and world.get_node("WorldDescription").initiate==true:
		#VerbGallery.verbchallenge(TextInput_Verb.text.strip_edges(true, true))
		world.get_node("Text_Animations").map_animation = false
		world.get_node("Text_Animations").inventory_animation = false
		world.get_node("Text_Animations").bodysprites_animation = false
		world.get_node("Label_Map").modulate.a=1
		world.get_node("Map").modulate.a=1
		get_node("Label_Inventory").modulate.a=1
		get_node("Inventory").modulate.a=1
		get_node("Body_Sprites").modulate.a=1
		get_node("VerbChallenge/VCtextinput").visible = true
		get_node("VerbChallenge/VCdescription").visible = true
		TextInput_Verb.visible = false
		TextInput_Objective.visible = false
		TextInput_Extra.visible = false
		get_node("Label_Connector").visible = false
		get_node("Label_Extra").visible = false
		get_node("Label_Objective").visible = false
		get_node("Label_Verb").visible = false
		#get_node("VerbChallenge/VCtextinput").grab_focus()
	#elif Input.is_key_pressed(KEY_ENTER) and just_pressed and (get_node("VerbChallenge/VCtextinput").get_focus_owner()==get_node("VerbChallenge/VCtextinput")) and world.get_node("WorldDescription").initiate==true:
		emit_signal("preturn")
		YourDescription.text=VerbGallery.execute_action(self,currentverbarray()[0].strip_edges(true, true),currentverbarray()[1].strip_edges(true, true),currentverbarray()[2].strip_edges(true, true))
		emit_signal("preturn")
		world.turn += 1
		world.get_node("Text_Animations").restart_turn()
		get_node("VerbChallenge/VCtextinput").visible = false
		get_node("VerbChallenge/VCdescription").visible = false
		#TextInput_Verb.visible = true
		#TextInput_Objective.visible = true
		#TextInput_Extra.visible = true
		#get_node("Label_Connector").visible = true
		#get_node("Label_Extra").visible = true
		#get_node("Label_Objective").visible = true
		#get_node("Label_Verb").visible = true
		get_node("Ideas").get_child(0).get_node("Input").text = ""
		activate_idea(get_node("Ideas").get_child(0))
		get_node("Ideas").get_child(0).position.x = 300
		get_node("Ideas").get_child(0).position.y = 600
		for i in range (1,get_node("Ideas").get_child_count(),1):
			get_node("Ideas").get_child(i).queue_free()
		#world.get_node("EventManager").run_npcaction()
		if status=="guard":
			status_timer+=1
			if status_timer==1:
				status_timer=0
				status=null
		
	#if Input.is_key_pressed(KEY_TAB) and just_pressed and (TextInput_Verb.get_focus_owner()==null) and world.get_node("WorldDescription").initiate==true:
	#	TextInput_Verb.grab_focus()
		
	if Input.is_key_pressed(KEY_TAB) and just_pressed and get_node("Ideas").get_child_count()>1 and world.get_node("WorldDescription").initiate==true:
		for i in range (0,get_node("Ideas").get_child_count(),1):
			if get_node("Ideas").get_child(i).Active == true and (i < get_node("Ideas").get_child_count()-1):
				activate_idea(get_node("Ideas").get_child(i+1))
				return
			elif get_node("Ideas").get_child(i).Active == true and (i == get_node("Ideas").get_child_count()-1):
				activate_idea(get_node("Ideas").get_child(0))
				return
	
	if (Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")) and world.get_node("WorldDescription").initiate==true:
		for i in range (0,get_node("Ideas").get_child_count(),1):
			if get_node("Ideas").get_child(i).Active == true:
				activate_idea(get_node("Ideas").get_child(i))

	
	#if world.get_node("WorldDescription").initiate==true:
		#if event.is_action_pressed("ui_up") and (TextInput_Verb.has_focus() or TextInput_Objective.has_focus() or TextInput_Extra.has_focus()):
			#get_tree().set_input_as_handled()
		#if event.is_action_pressed("ui_down") and (TextInput_Verb.has_focus() or TextInput_Objective.has_focus() or TextInput_Extra.has_focus()):
			#get_tree().set_input_as_handled()
		#if event.is_action_pressed("ui_right") and (TextInput_Verb.has_focus() or TextInput_Objective.has_focus() or TextInput_Extra.has_focus()):
			#get_tree().set_input_as_handled()
		#if event.is_action_pressed("ui_left") and (TextInput_Verb.has_focus() or TextInput_Objective.has_focus() or TextInput_Extra.has_focus()):
			#get_tree().set_input_as_handled()
	
	#if Input.is_key_pressed(KEY_UP) and world.get_node("WorldDescription").initiate==true:
		#world.get_node("Label_Map").visible=true
		#world.get_node("Map").visible=true
		#get_node("Label_Inventory").visible=true
		#get_node("Inventory").visible=true
		#get_node("Body_Sprites").visible=true
		#world.get_node("Text_Animations").map_animation = false
		#world.get_node("Text_Animations").inventory_animation = false
		#world.get_node("Text_Animations").bodysprites_animation = false
		#world.get_node("Label_Map").modulate.a=1
		#world.get_node("Map").modulate.a=1
		#get_node("Label_Inventory").modulate.a=1
		#get_node("Inventory").modulate.a=1
		#get_node("Body_Sprites").modulate.a=1
	#elif world.get_node("WorldDescription").initiate==true:
		#world.get_node("Label_Map").visible=false
		#world.get_node("Map").visible=false
		#get_node("Label_Inventory").visible=false
		#get_node("Inventory").visible=false
		#get_node("Body_Sprites").visible=false

func move_protagonist(place):
	get_parent().remove_child(self)
	Server.get_child(0).get_node(place).add_child(self)
	if Server.get_child(0).get_node(place).Position==[1,1]:
		Server.get_parent().get_node("Map").animation = "1 1"
	elif Server.get_child(0).get_node(place).Position==[1,2]:
		Server.get_parent().get_node("Map").animation = "1 2"
	elif Server.get_child(0).get_node(place).Position==[2,1]:
		Server.get_parent().get_node("Map").animation = "2 1"
	elif Server.get_child(0).get_node(place).Position==[2,2]:
		Server.get_parent().get_node("Map").animation = "2 2"
	Server.get_parent().get_node("Text_Animations").map_animation=true
	var falldescription = ""
	if get_node("Physicality").get_child(0).ExtraSize>0:
		get_node("Physicality").get_child(0).ExtraSize=0
		falldescription="You dropped to the floor. "
	return falldescription

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
							elif get_parent().get_child(i).get_child(j).on_object==false and get_parent().get_child(i).get_child(j).stack=="ontop":
								Interactuablethings.append(get_parent().get_child(i).get_child(j).get_path())
				#Include NPCs
				elif (get_parent().get_child(i).Name == "NPC"):
					if get_parent().get_child(i).get_node("Physicality").get_child_count()!=0:
						for j in range (0,get_parent().get_child(i).get_node("Physicality").get_child_count(),1):
							Interactuablethings.append(get_parent().get_child(i).get_node("Physicality").get_child(j).get_path())
							if get_parent().get_child(i).get_node("Physicality").get_child(j).get_child_count()!=0:
								for k in range (0,get_parent().get_child(i).get_node("Physicality").get_child(j).get_child_count(),1):
									Interactuablethings.append(get_parent().get_child(i).get_node("Physicality").get_child(j).get_child(k).get_path())
	#Include You
	if get_node("Physicality").get_child_count()!=0:
		for i in range (0,get_node("Physicality").get_child_count(),1):
			Interactuablethings.append(get_node("Physicality").get_child(i).get_path())
			if get_node("Physicality").get_child(i).get_child_count()!=0:
				for j in range (0,get_node("Physicality").get_child(i).get_child_count(),1):
					Interactuablethings.append(get_node("Physicality").get_child(i).get_child(j).get_path())
	return Interactuablethings

func get_objects():
	var Interactuablethings = []
	if get_parent().Name == "Space":
		#Include Objects
		if get_parent().get_child_count()!=0:
			for i in range (0,get_parent().get_child_count(),1):
				if (get_parent().get_child(i).Name == "Object")or(get_parent().get_child(i).Name == "Part"):
					Interactuablethings.append(get_parent().get_child(i).get_path())
				elif (get_parent().get_child(i).Name == "NPC"):
					Interactuablethings.append(get_parent().get_child(i).get_node("Physicality").get_child(0).get_path())
	return Interactuablethings

func getinput_stage1():
	get_node("Label_Connector").text="Press 'TAB' to specify action"
	get_node("Label_Objective").visible=false
	TextInput_Objective.visible=false
	TextInput_Objective.text=""
	get_node("Label_Extra").visible=false
	TextInput_Extra.visible=false
	TextInput_Extra.text=""

func getinput_stage2(verb):
	var currentverb = get_node("VerbGallery").getverb_array(verb)
	if currentverb != null:
		get_node("Label_Connector").text = currentverb[2]
		get_node("Label_Objective").visible = true
		TextInput_Objective.visible = true
		get_node("Label_Extra").text="Press 'TAB' to specify action more"
		get_node("Label_Extra").visible = true
		TextInput_Extra.visible=false
		TextInput_Extra.text=""

func getinput_stage3(verb):
	var currentverb = get_node("VerbGallery").getverb_array(verb)
	if currentverb != null:
		get_node("Label_Extra").text = currentverb[3]
		TextInput_Extra.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if get_node("VerbGallery").getverb_array(TextInput_Verb.text.strip_edges(true, true))==null and world.get_node("WorldDescription").initiate==true:
		#TextInput_Verb.grab_focus()
		#getinput_stage1()
	if status=="guard":
		get_node("Physicality").get_child(0).Structure = get_node("Physicality").get_child(0).get_child_count()*2
	else:
		get_node("Physicality").get_child(0).Structure = get_node("Physicality").get_child(0).get_child_count()
	
	if Stamina>100:
		Stamina = 100
	if Stamina<0:
		Stamina = 0
	if Focus>100:
		Focus = 100
	if Focus<0:
		Focus = 0
	if Temperature>100:
		Temperature = 100
	if Temperature<-100:
		Temperature = -100
	
	if world.get_node("WorldDescription").initiate==false:
		world.get_node("Control").set_focus_mode(2)
		world.get_node("Control").grab_focus()
	else:
		world.get_node("Control").set_focus_mode(0)

func getvalue_taste(taste):
	var value = 0
	if value==0:
		for i in range (0,liked_tastes.size(),1):
			if (liked_tastes[i] in taste) and ("super" in taste):
				value = 2
			elif (liked_tastes[i]==taste):
				value = 1
	if value==0:
		for i in range (0,disliked_tastes.size(),1):
			if (disliked_tastes[i] in taste) and ("super" in taste):
				value = -2
			elif (disliked_tastes[i]==taste):
				value = -1
	return value

func getvalue_smell(smell):
	var value = 0
	if value==0:
		for i in range (0,liked_smells.size(),1):
			if (liked_smells[i] in smell) and ("super" in smell):
				value = 2
			elif (liked_smells[i]==smell):
				value = 1
	if value==0:
		for i in range (0,disliked_smells.size(),1):
			if (disliked_smells[i] in smell) and ("super" in smell):
				value = -2
			elif (disliked_smells[i]==smell):
				value = -1
	return value
	
func getvalue_sound(sound):
	var value = 0
	if value==0:
		for i in range (0,liked_sounds.size(),1):
			if (liked_sounds[i] in sound) and ("super" in sound):
				value = 2
			elif (liked_sounds[i]==sound):
				value = 1
	if value==0:
		for i in range (0,disliked_sounds.size(),1):
			if (disliked_sounds[i] in sound) and ("super" in sound):
				value = -2
			elif (disliked_sounds[i]==sound):
				value = -1
	return value

func getvalue_texture(texture):
	var value = 0
	if value==0:
		for i in range (0,liked_textures.size(),1):
			if (liked_textures[i] in texture) and ("super" in texture):
				value = 2
			elif (liked_textures[i]==texture):
				value = 1
	if value==0:
		for i in range (0,disliked_textures.size(),1):
			if (disliked_textures[i] in texture) and ("super" in texture):
				value = -2
			elif (disliked_textures[i]==texture):
				value = -1
	return value
	
func pass_turn():
	YourDescription.text=VerbGallery.execute_action(self,currentverbarray()[0].strip_edges(true, true),currentverbarray()[1].strip_edges(true, true),currentverbarray()[2].strip_edges(true, true))
	world.turn += 1
	world.get_node("Text_Animations").restart_turn()
	get_node("VerbChallenge/VCtextinput").visible = false
	get_node("VerbChallenge/VCdescription").visible = false
	TextInput_Verb.visible = false
	TextInput_Objective.visible = false
	TextInput_Extra.visible = false
	get_node("Label_Connector").visible = false
	get_node("Label_Extra").visible = false
	get_node("Label_Objective").visible = false
	get_node("Label_Verb").visible = false
	#get_node("TextInput_Verb").grab_focus()
	#world.get_node("EventManager").run_npcaction()
	get_node("Ideas").get_child(0).get_node("Input").text = ""
	activate_idea(get_node("Ideas").get_child(0))
	get_node("Ideas").get_child(0).position.x = 300
	get_node("Ideas").get_child(0).position.y = 600
	for i in range (1,get_node("Ideas").get_child_count(),1):
		get_node("Ideas").get_child(i).queue_free()
	if status=="guard":
		status_timer+=1
		if status_timer==1:
			status_timer=0
			status=null

func activate_idea(idea):
	for i in range (0,idea.get_parent().get_child_count(),1):
		if idea.get_parent().get_child(i)==idea:
			idea.get_parent().get_child(i).Active = true
			idea.get_parent().get_child(i).get_node("Input").grab_focus()
			idea.get_parent().get_child(i).get_node("Input").set_cursor_position(idea.get_parent().get_child(i).get_node("Input").text.length())
		else:
			idea.get_parent().get_child(i).Active = false

func get_active_idea():
	for i in range (0,get_node("Ideas").get_child_count(),1):
		if get_node("Ideas").get_child(i).Active == true:
			return (get_node("Ideas").get_child(i))

func currentverbarray():
	var array = []
	if get_node("Ideas").currentverb!=null:
		array.append(get_node("Ideas").currentverb.get_node("Input").text)
		if get_node("Ideas").currentverb.link!=null:
			array.append(get_node("Ideas").currentverb.link.get_node("Input").text)
			if get_node("Ideas").currentverb.link.link!=null:
				array.append(get_node("Ideas").currentverb.link.link.get_node("Input").text)
			else:
				array.append("")
		else:
			array.append("")
			array.append("")
	else:
		array = ["","",""]
	return array

