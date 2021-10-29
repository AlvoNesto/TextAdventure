extends Node


# Declare member variables here. Examples:
# var a = 2

var currentverb


func _process(delta):
	if currentverb!=null:
		var currentverbcheck = false
		for i in range(0,get_child_count(),1):
			if get_child(i)==currentverb:
				currentverbcheck = true
		if currentverbcheck == false:
			currentverb = null
