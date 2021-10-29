extends Node

onready var Protagonist = get_parent().get_node("Protagonist")
onready var sound = get_node("Sound_HB")

var map_animation = false
var inventory_animation = false
var bodysprites_animation = false
var time = 0

func _ready():
	Protagonist.connect("initiate",self,"initiate_sound")

func initiate_sound():
	sound.play()

func restart_turn():
	Protagonist.get_node("YourDescription").modulate.a = 1
	Protagonist.get_node("DescriptionPlus").modulate.a = 1
	get_parent().get_node("EnemyDescription").modulate.a = 1
	get_parent().get_node("Result").modulate.a = 1
	get_parent().get_node("WorldDescription").modulate.a = 1
	get_parent().get_node("EventManager/Label_Event").modulate.a = 1
	time = 0

func _process(delta):
	#Turn Timer
	time += 1
	if get_parent().get_node("WorldDescription").initiate == true and get_parent().get_node("WorldDescription").gameover==false:
		if time>3000:
			if Protagonist.get_node("YourDescription").modulate.a > 0:
				Protagonist.get_node("YourDescription").modulate.a -= 0.0005
			elif Protagonist.get_node("DescriptionPlus").modulate.a > 0:
				Protagonist.get_node("DescriptionPlus").modulate.a -= 0.0005
			elif get_parent().get_node("EnemyDescription").modulate.a > 0:
				get_parent().get_node("EnemyDescription").modulate.a -= 0.0010
			elif get_parent().get_node("Result").modulate.a > 0:
				get_parent().get_node("Result").modulate.a -= 0.0010
			elif get_parent().get_node("WorldDescription").modulate.a > 0:
				get_parent().get_node("WorldDescription").modulate.a -= 0.0010
			elif get_parent().get_node("EventManager/Label_Event").modulate.a > 0:
				get_parent().get_node("EventManager/Label_Event").modulate.a -= 0.0010
			else:
				Protagonist.pass_turn()
	
	#Shake Animation
	if get_parent().get_node("WorldDescription").initiate==true and get_parent().get_node("WorldDescription").gameover==false:
		var level = ((100-Protagonist.Focus)/100.0)*30
		var wave
		if Protagonist.Focus>=66:
			wave = 0
		if Protagonist.Focus<66 and Protagonist.Focus>=33:
			wave = 30
		if Protagonist.Focus<33:
			wave = 70
		if ("shake" in Protagonist.get_node("YourDescription").text)==false:
			Protagonist.get_node("YourDescription").bbcode_text = "[wave amp="+str(wave)+"][shake rate=10 level="+str(level)+"]"+Protagonist.get_node("YourDescription").text+"[/shake][/wave]"
		if ("shake" in Protagonist.get_node("DescriptionPlus").text)==false:
			Protagonist.get_node("DescriptionPlus").bbcode_text = "[wave amp="+str(wave)+"][shake rate=10 level="+str(level)+"]"+Protagonist.get_node("DescriptionPlus").text+"[/shake][/wave]"
		if ("shake" in get_parent().get_node("EnemyDescription").text)==false:
			get_parent().get_node("EnemyDescription").bbcode_text = "[wave amp="+str(wave)+"][shake rate=10 level="+str(level)+"]"+get_parent().get_node("EnemyDescription").text+"[/shake][/wave]"
		if ("shake" in get_parent().get_node("Result").text)==false:
			get_parent().get_node("Result").bbcode_text = "[wave amp="+str(wave)+"][shake rate=10 level="+str(level)+"]"+get_parent().get_node("Result").text+"[/shake][/wave]"
		if ("shake" in get_parent().get_node("WorldDescription").text)==false:
			get_parent().get_node("WorldDescription").bbcode_text = "[wave amp="+str(wave)+"][shake rate=10 level="+str(level)+"]"+get_parent().get_node("WorldDescription").text+"[/shake][/wave]"
		if ("shake" in get_parent().get_node("EventManager/Label_Event").text)==false:
			get_parent().get_node("EventManager/Label_Event").bbcode_text = "[wave amp="+str(wave)+"][shake rate=10 level="+str(level)+"]"+get_parent().get_node("EventManager/Label_Event").text+"[/shake][/wave]"
		
		
	
	#Sound Effect Heart Beat
	if get_parent().get_node("WorldDescription").initiate==true and get_parent().get_node("WorldDescription").gameover==false:
		if Protagonist.Stamina>=50:
			sound.volume_db = -10
		if Protagonist.Stamina<50:
			sound.volume_db = 0
		if Protagonist.Stamina==100:
			sound.volume_db = -20
		var scale = (100-Protagonist.Stamina)/100.0+0.7
		sound.pitch_scale = scale
	
	if map_animation==true and get_parent().get_node("WorldDescription").initiate==true and get_parent().get_node("WorldDescription").gameover==false:
		get_parent().get_node("Label_Map").visible=true
		get_parent().get_node("Map").visible=true
		if get_parent().get_node("Label_Map").modulate.a > 0:
			get_parent().get_node("Label_Map").modulate.a -= 0.0025
		if get_parent().get_node("Map").modulate.a > 0:
			get_parent().get_node("Map").modulate.a -= 0.0025
		if get_parent().get_node("Label_Map").modulate.a<=0 and get_parent().get_node("Map").modulate.a<=0:
			map_animation=false
			get_parent().get_node("Label_Map").visible=false
			get_parent().get_node("Map").visible=false
			get_parent().get_node("Label_Map").modulate.a = 1
			get_parent().get_node("Map").modulate.a = 1
			
	if inventory_animation==true and get_parent().get_node("WorldDescription").initiate==true and get_parent().get_node("WorldDescription").gameover==false:
		Protagonist.get_node("Label_Inventory").visible=true
		Protagonist.get_node("Inventory").visible=true
		if Protagonist.get_node("Label_Inventory").modulate.a > 0:
			Protagonist.get_node("Label_Inventory").modulate.a -= 0.0025
		if Protagonist.get_node("Inventory").modulate.a > 0:
			Protagonist.get_node("Inventory").modulate.a -= 0.0025
		if Protagonist.get_node("Label_Inventory").modulate.a<=0 and Protagonist.get_node("Inventory").modulate.a<=0:
			inventory_animation=false
			Protagonist.get_node("Label_Inventory").visible=false
			Protagonist.get_node("Inventory").visible=false
			Protagonist.get_node("Label_Inventory").modulate.a=1
			Protagonist.get_node("Inventory").modulate.a=1
	
	if bodysprites_animation==true and get_parent().get_node("WorldDescription").initiate==true and get_parent().get_node("WorldDescription").gameover==false:
		Protagonist.get_node("Body_Sprites").visible=true
		if Protagonist.get_node("Body_Sprites").modulate.a > 0:
			Protagonist.get_node("Body_Sprites").modulate.a -= 0.0025
		if Protagonist.get_node("Body_Sprites").modulate.a<=0:
			bodysprites_animation=false
			Protagonist.get_node("Body_Sprites").visible=false
			Protagonist.get_node("Body_Sprites").modulate.a=1
	

