extends Node

onready var ObjectGallery = get_node("ObjectGallery")
onready var Protagonist = get_node("Protagonist")

var turn = 1

var Name
var NewPart = null
var NewSpace = null
var NewRoom = null
var NewAsset = null

# LAWS

func getmaterialproperties(obj):
	if obj.material=="flesh" or obj.material=="organic":
		obj.materialpower = 1
	if obj.material=="wood":
		obj.materialpower = 2
	if obj.material=="rock":
		obj.materialpower = 3
	if obj.material=="metal":
		obj.materialpower = 4


func clash(obj1, obj2, acc):
	#convert to parts if necessary
	if obj1.Name=="Object":
		obj1=obj1.get_child(0)
	if obj2.Name=="Object":
		obj2=obj2.get_child(0)
	
	#Prepare calculation variables
	getmaterialproperties(obj1)
	getmaterialproperties(obj2)
	var obj1_power = obj1.materialpower*obj1.constitution*obj1.kineticstate*obj1.structure*acc
	var obj2_power = obj2.materialpower*obj2.constitution*obj2.kineticstate*obj2.structure
	var damage1 = obj1_power-obj2_power
	var damage2 = obj2_power-obj1_power
	
	#animations
	if obj1.Name=="Object":
		if obj1.NPCbody==true:
			get_node("Text_Animations").bodysprites_animation = true
	if obj1.Name=="Part":
		if obj1.partowner=="you":
			get_node("Text_Animations").bodysprites_animation = true
	if obj2.Name=="Object":
		if obj2.NPCbody==true:
			get_node("Text_Animations").bodysprites_animation = true
	if obj2.Name=="Part":
		if obj2.partowner=="you":
			get_node("Text_Animations").bodysprites_animation = true
	
	#Damage calculation
	if obj1.Name!="Asset" and obj2.Name!="Asset":
		if damage1<0:
			damage1 = abs(damage1)
			obj1.durability -= damage1
		else:
			damage1=0.1
			obj1.durability -= damage1
		if damage2<0:
			damage2 = abs(damage2)
			obj2.durability -= damage2
		else:
			damage2 = 0.1
			obj2.durability -= damage2
		var damage_results = [damage1,damage2]
		Protagonist.get_node("Body_Sprites").update_bodydamage()
		obj1.check_partdestruction()
		obj2.check_partdestruction()
		var stringdamage = [stringdamage(obj1,damage_results[0]),stringdamage(obj2,damage_results[1]),damagecomparison(obj1,damage_results[0],obj2,damage_results[1])]
		return stringdamage
	elif obj1.Name=="Asset":
		if damage2<0:
			damage2 = abs(damage2)
			obj2.durability -= damage2
		else:
			damage2 = 0.1
			obj2.durability -= damage2
		var damage_results = [0,damage2]
		Protagonist.get_node("Body_Sprites").update_bodydamage()
		obj2.check_partdestruction()
		var stringdamage = [stringdamage(obj1,damage_results[0]),stringdamage(obj2,damage_results[1]),damagecomparison(obj1,damage_results[0],obj2,damage_results[1])]
		return stringdamage
	elif obj2.Name=="Asset":
		if damage1<0:
			damage1 = abs(damage1)
			obj1.durability -= damage1
		else:
			damage1 = 0.1
			obj1.durability -= damage1
		var damage_results = [damage1,0]
		Protagonist.get_node("Body_Sprites").update_bodydamage()
		obj1.check_partdestruction()
		var stringdamage = [stringdamage(obj1,damage_results[0]),stringdamage(obj2,damage_results[1]),damagecomparison(obj1,damage_results[0],obj2,damage_results[1])]
		return stringdamage
	
func stringdamage(obj,damage):
	var stringdamage
	if (obj.durability/2)<=damage:
		stringdamage="a massive amount"
	elif (obj.durability/2)>damage and (obj.durability/4)<=damage:
		stringdamage="a big amount"
	elif (obj.durability/4)>damage and (obj.durability/10)<=damage:
		stringdamage="some amount"
	elif (obj.durability/10)>damage and (obj.durability/20)<=damage:
		stringdamage="a little of damage"
	elif (obj.durability/20)>damage:
		stringdamage="an insignificant amount"
	return stringdamage

func damagecomparison(obj1,damage1,obj2,damage2):
	var stringcomparison
	if (obj1.durability/20)>damage1 and (obj2.durability/20)>damage2:
		stringcomparison="It was uneffective and most damage was nullified. "
	elif (obj1.durability/20)>damage1 and ((obj2.durability/10)>damage2 and (obj2.durability/20)<=damage2):
		stringcomparison="It was not very effective. "
	elif (obj1.durability/20)>damage1 and ((obj2.durability/4)>damage2 and (obj2.durability/10)<=damage2):
		stringcomparison="It was somewhat effective. "
	elif (obj1.durability/20)>damage1 and ((obj2.durability/2)>damage2 and (obj2.durability/4)<=damage2):
		stringcomparison="It was effective. "
	elif (obj1.durability/20)>damage1 and (obj2.durability/2)<=damage2:
		stringcomparison="It was super effective. "
	elif ((obj1.durability/10)>damage1 and (obj1.durability/20)<=damage1):
		stringcomparison="It was uneffective and a little amount of damage bounced back. "
	elif ((obj1.durability/4)>damage1 and (obj1.durability/10)<=damage1):
		stringcomparison="It was uneffective and some amount of damage bounced back. "
	elif ((obj1.durability/2)>damage1 and (obj1.durability/4)<=damage1):
		stringcomparison="It was uneffective and a big amount of damage bounced back. "
	elif (obj1.durability/2)<=damage1:
		stringcomparison="It was uneffective and a massive amount of damage bounced back. "
	return stringcomparison

func generatepart(Type, RealName, GeneralDescription, size, weight, durability, constitution, texture, taste, smell, sound, material):
	var Part = load("res://Scenes/Part.tscn")
	NewPart = Part.instance()
	NewPart.Type = Type
	NewPart.RealName = RealName
	NewPart.GeneralDescription = GeneralDescription
	NewPart.Size = size
	NewPart.Weight = weight
	NewPart.Maxdurability = durability
	NewPart.durability = durability
	NewPart.constitution = constitution
	NewPart.texture = texture
	NewPart.taste = taste
	NewPart.smell = smell
	NewPart.sound = sound
	NewPart.material = material
	return NewPart

func generatespace(Type, Position, GeneralDescription, Size, Temperature, Air):
	var Space = load("res://Scenes/Space.tscn")
	NewSpace = Space.instance()
	NewSpace.Type = Type
	NewSpace.Position = Position
	NewSpace.GeneralDescription = GeneralDescription
	NewSpace.Size = Size
	NewSpace.Temperature = Temperature
	NewSpace.Air = Air
	return NewSpace

func generateasset(Type, RealName, GeneralDescription, Reach, material,texture,taste,smell,sound):
	var Asset = load("res://Scenes/Asset.tscn")
	NewAsset = Asset.instance()
	NewAsset.Type = Type
	NewAsset.RealName = RealName
	NewAsset.GeneralDescription = GeneralDescription
	NewAsset.Reach = Reach
	NewAsset.material = material
	NewAsset.texture = texture
	NewAsset.taste = taste
	NewAsset.smell = smell
	NewAsset.sound = sound
	return NewAsset
