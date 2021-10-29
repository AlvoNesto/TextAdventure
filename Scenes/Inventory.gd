extends RichTextLabel

onready var world = get_node("/root/World")
var last_text = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	text = ""
	var included = []
	for i in range (1,get_parent().get_node("Physicality").get_child_count(),1):
		var count = 0
		if included.size()>0:
			var valid = true
			for j in range (0,included.size(),1):
				if get_parent().get_node("Physicality").get_child(i).RealName[0]==included[j].RealName[0]:
					valid = false
			if valid == true:
				for j in range (i,get_parent().get_node("Physicality").get_child_count(),1):
					if get_parent().get_node("Physicality").get_child(i).RealName[0]==get_parent().get_node("Physicality").get_child(j).RealName[0]:
						count += 1
				included.append(get_parent().get_node("Physicality").get_child(i))
				text += "\n"+str(count)+" "+get_parent().get_node("Physicality").get_child(i).RealName[0]
		else:
			for j in range (i,get_parent().get_node("Physicality").get_child_count(),1):
				if get_parent().get_node("Physicality").get_child(i).RealName[0]==get_parent().get_node("Physicality").get_child(j).RealName[0]:
					count += 1
			included.append(get_parent().get_node("Physicality").get_child(i))
			text += str(count)+" "+get_parent().get_node("Physicality").get_child(i).RealName[0]
	
	if text!=last_text:
		last_text = text
		world.get_node("Text_Animations").inventory_animation = true
