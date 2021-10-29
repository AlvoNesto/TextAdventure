extends Sprite

onready var world = get_node("/root/World")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func check_bodypart(part):
	if part.RealName[0]=="Your head":
		get_node("Head").visible = false
	elif part.RealName[0]=="Your chest":
		get_node("Chest").visible = false
	elif part.RealName[0]=="Your right arm":
		get_node("RightArm").visible = false
	elif part.RealName[0]=="Your left arm":
		get_node("LeftArm").visible = false
	elif part.RealName[0]=="Your right leg":
		get_node("RightLeg").visible = false
	elif part.RealName[0]=="Your left leg":
		get_node("LeftLeg").visible = false
	return

func update_bodydamage():
	for i in range (0,get_parent().get_node("Physicality").get_child(0).get_child_count(),1):
		if get_parent().get_node("Physicality").get_child(0).get_child(i).RealName[0]=="Your head":
			var percentage = (7-get_parent().get_node("Physicality").get_child(0).get_child(i).durability)/7.0
			get_node("Head/HeadRed").modulate.a = percentage
		if get_parent().get_node("Physicality").get_child(0).get_child(i).RealName[0]=="Your chest":
			var percentage = (7-get_parent().get_node("Physicality").get_child(0).get_child(i).durability)/7.0
			get_node("Chest/ChestRed").modulate.a = percentage
		if get_parent().get_node("Physicality").get_child(0).get_child(i).RealName[0]=="Your right arm":
			var percentage = (7-get_parent().get_node("Physicality").get_child(0).get_child(i).durability)/7.0
			get_node("RightArm/RightArmRed").modulate.a = percentage
		if get_parent().get_node("Physicality").get_child(0).get_child(i).RealName[0]=="Your left arm":
			var percentage = (7-get_parent().get_node("Physicality").get_child(0).get_child(i).durability)/7.0
			get_node("LeftArm/LeftArmRed").modulate.a = percentage
		if get_parent().get_node("Physicality").get_child(0).get_child(i).RealName[0]=="Your right leg":
			var percentage = (7-get_parent().get_node("Physicality").get_child(0).get_child(i).durability)/7.0
			get_node("RightLeg/RightLegRed").modulate.a = percentage
		if get_parent().get_node("Physicality").get_child(0).get_child(i).RealName[0]=="Your left leg":
			var percentage = (7-get_parent().get_node("Physicality").get_child(0).get_child(i).durability)/7.0
			get_node("LeftLeg/LeftLegRed").modulate.a = percentage
