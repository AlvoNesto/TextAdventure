extends Node

onready var world = get_node("/root/World")
onready var Protagonist = get_node("/root/World/Protagonist")

var Name = "Asset"
var Type
var RealName
var Size = 10
var Weight = 10
var Maxdurability = 1000
var durability = 1000
var constitution = 7
var GeneralDescription
var texture
var taste
var smell
var sound
var material
var structure = 1
var Reach

var materialpower = 1
var kineticstate = 1

var on_object = false
var partowner = "none"
var nodeowner = null
var NPCbody

var openable = "none"
var stack = "none"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
