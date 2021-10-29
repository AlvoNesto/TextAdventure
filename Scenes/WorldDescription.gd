extends RichTextLabel

onready var Server = get_parent().get_node("Server")
onready var Protagonist = get_parent().get_node("Protagonist")

var initiate
var gameover = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Server.time==52 and initiate==false and gameover==false:
		get_parent().get_node("Tutorial").introduction(get_parent().get_node("Tutorial").currentpage)
	if Server.time>=51 and initiate==true and gameover==false:
		text = "In this space there is "
		var things = Protagonist.get_objects()
		var included = []
		var count
		if things.size()>0:
			for i in range (0,things.size(),1):
				count = 0
				if get_node(things[i]).stack == "none":
					if included.size()>0:
						var valid = true
						for j in range (0,included.size(),1):
							if get_node(things[i]).RealName[0]==get_node(included[j]).RealName[0] and get_node(included[j]).stack!="base":
								valid = false
						if valid == true:
							for j in range (i,things.size(),1):
								if get_node(things[i]).RealName[0]==get_node(things[j]).RealName[0] and get_node(things[j]).stack=="none":
									count += 1
							included.append(things[i])
							text += "; "+str(count)+" "+get_node(things[i]).RealName[0]
					else:
						for j in range (i,things.size(),1):
							if get_node(things[i]).RealName[0]==get_node(things[j]).RealName[0] and get_node(things[j]).stack=="none":
								count += 1
						included.append(things[i])
						text += str(count)+" "+get_node(things[i]).RealName[0]
				elif get_node(things[i]).stack == "base":
					var stackcount=0
					for j in range (0,get_node(things[i]).get_child_count(),1):
						if get_node(things[i]).get_child(j).stack=="ontop":
							stackcount+=1
					if stackcount==1 and included.size()==0:
						text += " a "+get_node(things[i]).RealName[0]+" with "
					elif stackcount==1 and included.size()>0:
						text += "; a "+get_node(things[i]).RealName[0]+" with "
					elif stackcount>1 and included.size()==0:
						text += " a "+get_node(things[i]).RealName[0]+" with "
					else:
						text += "; a "+get_node(things[i]).RealName[0]+" with a stack of "
					included.append(things[i])
					stackcount=0
					for j in range (0,get_node(things[i]).get_child_count(),1):
						if get_node(things[i]).get_child(j).stack=="ontop" and stackcount==0:
							text += " a "+get_node(things[i]).get_child(j).RealName[0]
							stackcount+=1
						elif get_node(things[i]).get_child(j).stack=="ontop" and stackcount>0:
							text += ", a "+get_node(things[i]).get_child(j).RealName[0]
							stackcount+=1
					text += " on top of it"
		else:
			text += "nothing."
	elif gameover==true:
			text = "GAME OVER (close and open again to restart)"
