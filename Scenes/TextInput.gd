extends LineEdit

onready var VerbGallery = get_parent().get_node("VerbGallery")
onready var YourDescription = get_parent().get_node("YourDescription")

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_ENTER) and just_pressed:
		YourDescription.text=VerbGallery.execute_action(text)
