extends Node

onready var RoomGallery = get_parent().get_node("RoomGallery")
onready var Protagonist = get_parent().get_node("Protagonist")
var NewRoom

var time = 0

var Name = "Server"
var Type

func _ready():
	NewRoom=RoomGallery.generate_dungeonroom()

func _process(delta):
	time += 1
	if time<50:
		get_parent().get_node("WorldDescription").text="Loading..."
		get_parent().get_node("Map").visible=false
		get_parent().get_node("Label_Map").visible=false
		get_parent().get_node("Protagonist/TextInput_Verb").visible=false
		get_parent().get_node("Protagonist/TextInput_Objective").visible=false
		get_parent().get_node("Protagonist/TextInput_Extra").visible=false
		get_parent().get_node("Protagonist/Label_Verb").visible=false
		get_parent().get_node("Protagonist/Label_Objective").visible=false
		get_parent().get_node("Protagonist/YourStats").visible=false
		get_parent().get_node("Protagonist/Label_Extra").visible=false
		get_parent().get_node("Protagonist/Label_Connector").visible=false
		get_parent().get_node("Label_Turn").visible=false
		Protagonist.get_node("Body_Sprites").visible=false
		Protagonist.get_node("Label_Inventory").visible=false
		Protagonist.get_node("Inventory").visible=false
	#if time==50:
		#get_parent().get_node("Map").visible=true
		#get_parent().get_node("Label_Map").visible=true
		#Protagonist.get_node("Body_Sprites").visible=true
		#Protagonist.get_node("Label_Inventory").visible=true
		#Protagonist.get_node("Inventory").visible=true
		#get_parent().get_node("Protagonist/TextInput_Verb").visible=true
		#get_parent().get_node("Protagonist/TextInput_Objective").visible=true
		#get_parent().get_node("Protagonist/TextInput_Extra").visible=true
		#get_parent().get_node("Protagonist/Label_Verb").visible=true
		#get_parent().get_node("Protagonist/Label_Objective").visible=true
		#get_parent().get_node("Protagonist/YourStats").visible=true
		#get_parent().get_node("Label_Turn").visible=true
		#get_parent().get_node("Protagonist/Label_Extra").visible=true
		#get_parent().get_node("Protagonist/Label_Connector").visible=true
		#Protagonist.getinput_stage1()
	if time==51:
		get_parent().get_node("WorldDescription").initiate=false
		get_parent().get_node("Protagonist").move_protagonist(get_child(0).get_child(0).get_path())

func _exit_tree():
	NewRoom.free()
