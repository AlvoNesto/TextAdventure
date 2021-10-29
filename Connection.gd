extends Node

#Connection data
var Name = "Connection"
var node
var Type
var memory
var tolerance
var imageofyou
var last_memory
var knowledge_about

var interactedwithit = 0
var courtesy = 0 

var generic = false

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_ENTER) and just_pressed:
		if generic==true:
			for i in range (0,get_parent().knownthings.size(),1):
				if get_parent().knownthings[i]==self:
					get_parent().knownthings.remove(i)
					return
			queue_free()
