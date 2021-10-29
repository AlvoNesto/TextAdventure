extends LineEdit

onready var world = get_node("/root/World")
onready var Protagonist = get_parent().get_parent().get_parent()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if get_focus_owner()!=self:
		text = text.strip_edges()

func _input(event):
	if world.get_node("WorldDescription").initiate==true:
		if event.is_action_pressed("ui_up"):
			get_tree().set_input_as_handled()
		if event.is_action_pressed("ui_down"):
			get_tree().set_input_as_handled()
		if event.is_action_pressed("ui_right"):
			get_tree().set_input_as_handled()
		if event.is_action_pressed("ui_left"):
			get_tree().set_input_as_handled()
	

