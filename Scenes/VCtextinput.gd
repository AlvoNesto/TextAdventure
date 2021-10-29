extends LineEdit

var challenge_answers = []
var default_fontcolor = true

func _ready():
	pass # Replace with function body.

func _process(delta):
	if default_fontcolor:
		add_color_override("font_color", Color(1,1,1,1))

	for i in range (0,challenge_answers.size(),1):
		if (text.strip_edges(true, true)==challenge_answers[i]):
			add_color_override("font_color", Color(1,1,0,1))
			default_fontcolor = false
		elif i==challenge_answers.size()-1:
			default_fontcolor = true

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_ENTER) and just_pressed and (visible) and (get_focus_owner()==self):
		for i in range (0,challenge_answers.size(),1):
			if (text.strip_edges(true, true)==challenge_answers[i]):
				text = ""
	
	if (Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN)) and just_pressed and (visible) and (get_focus_owner()!=self):
		grab_focus()
	elif (Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN)) and just_pressed:
		get_parent().get_parent().get_node("TextInput_Verb").grab_focus()
