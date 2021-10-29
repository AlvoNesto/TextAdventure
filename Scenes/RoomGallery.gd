extends Node

onready var ObjectGallery = get_node("/root/World/ObjectGallery")
onready var NPCGallery = get_node("/root/World/NPCGallery")
onready var Server = get_parent().get_node("Server")

#DugeonRoom
func generate_dungeonroom():
	#create room
	var room = load("res://Scenes/Room.tscn")
	var dungeonroom = room.instance()
	dungeonroom.GeneralDescription = "A big dungeon room"
	#create spaces
	var space1 = get_parent().generatespace("dungeon space",[1,1],"It's just space 1",10,-1,-1)
	var space2 = get_parent().generatespace("dungeon space",[2,1],"It's just space 2",10,-1,-2)
	var space3 = get_parent().generatespace("dungeon space",[1,2],"It's just space 3",10,-1,0)
	var space4 = get_parent().generatespace("dungeon space",[2,2],"It's just space 4",10,-1,-1)
	#create assets
	var floor1 = ObjectGallery.generate_floor()
	var floor2 = ObjectGallery.generate_floor()
	var floor3 = ObjectGallery.generate_floor()
	var floor4 = ObjectGallery.generate_floor()
	var wall1 = ObjectGallery.generate_wall()
	var wall2 = ObjectGallery.generate_wall()
	var wall3 = ObjectGallery.generate_wall()
	var wall4 = ObjectGallery.generate_wall()
	var ceiling1 = ObjectGallery.generate_ceiling()
	var ceiling2 = ObjectGallery.generate_ceiling()
	var ceiling3 = ObjectGallery.generate_ceiling()
	var ceiling4 = ObjectGallery.generate_ceiling()
	#Change atributes of assets
	wall3.smell = "clean"
	#create objects
	var box = ObjectGallery.generate_box()
	#create NPCs
	var npc1 = NPCGallery.generate_pepe()
	#Allocate room in server
	get_parent().get_node("Server").add_child(dungeonroom)
	dungeonroom.add_child(space1)
	dungeonroom.add_child(space2)
	dungeonroom.add_child(space3)
	dungeonroom.add_child(space4)
	#Allocate assets in spaces
	space1.add_child(floor1)
	space2.add_child(floor2)
	space3.add_child(floor3)
	space4.add_child(floor4)
	space1.add_child(wall1)
	space2.add_child(wall2)
	space3.add_child(wall3)
	space4.add_child(wall4)
	space1.add_child(ceiling1)
	space2.add_child(ceiling2)
	space3.add_child(ceiling3)
	space4.add_child(ceiling4)
	#Allocate objects in spaces
	space1.add_child(box)
	#Allocate NPCs in spaces
	space3.add_child(npc1)
	#return room node
	return dungeonroom

