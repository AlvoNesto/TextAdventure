extends Label

func _ready():
	pass # Replace with function body.

func _process(delta):
	if (visible):
		text = "Stamina: " + String(round(get_parent().Stamina))+"%\nFocus: " + String(round(get_parent().Focus))+"%"
