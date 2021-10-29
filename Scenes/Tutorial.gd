extends Node

onready var your_description = get_parent().get_node("Protagonist/YourDescription")
onready var enemy_description = get_parent().get_node("EnemyDescription")
onready var result = get_parent().get_node("Result")
onready var world_description = get_parent().get_node("WorldDescription")
onready var label_event = get_parent().get_node("EventManager/Label_Event")
onready var Protagonist = get_parent().get_node("Protagonist")

var currentpage = 1

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

func introduction(page):
	if page==0:
		your_description.text = ""
		enemy_description.text = ""
		result.text = ""
		world_description.text = ""
		label_event = ""
		#UI
		get_parent().get_node("Text_Animations").map_animation=true
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").text = ""
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
	if page==1:
		your_description.text = "Introduction (1/8)"
		enemy_description.text = "Welcome to this Prototype! Alvo, at your service. "
		result.text = ""
		world_description.text = "Press 'RIGHT ARROW' to continue reading \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = false
		get_parent().get_node("Map").visible = false
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
	if page==2:
		your_description.text = "Introduction (2/8)"
		enemy_description.text = "Following this introduction you will be thrown into a 'Test room'. "
		result.text = "It is a place designed to put you against the general capabilities of a text based immersive sim. "
		world_description.text = "Press 'LEFT ARROW' to go back or 'RIGHT ARROW' to continue reading \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = false
		get_parent().get_node("Map").visible = false
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
	if page==3:
		your_description.text = "Introduction (3/8)"
		enemy_description.text = "To act you have to write a SINGLE 'VERB' in the textbox below and then submit it by pressing 'ENTER'. "
		result.text = "Some verbs make sense by themselves but others may need further detail like in the example below. Some other verbs may also give you the option to add even further detail if you want. You can give any form of detail by pressing 'TAB' when allowed. "
		world_description.text = "Press 'LEFT ARROW' to go back or 'RIGHT ARROW' to continue reading \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = false
		get_parent().get_node("Map").visible = false
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = true
		Protagonist.get_node("TextInput_Verb").text = "go"
		Protagonist.get_node("TextInput_Verb").visible = true
		Protagonist.get_node("Label_Connector").text = "to"
		Protagonist.get_node("Label_Connector").visible = true
		Protagonist.get_node("Label_Objective").visible = true
		Protagonist.get_node("TextInput_Objective").text = "north"
		Protagonist.get_node("TextInput_Objective").visible = true
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
	if page==4:
		your_description.text = "Introduction (4/8)"
		enemy_description.text = "After submitting a verb you will have to 'organize your thoughts' like in the example below and then submit them by pressing 'ENTER'. "
		result.text = "To 'organize your thoughts' you will have to write in the large textbox a sentence that makes sense using the 'thoughts' (phrases) that will appear above. You can use ANY number and combinations of 'thoughts'; you can even leave the textbox blank or with an incomplete sentence if your want; but the larger and coherent, the better the result. "
		world_description.text = "Press 'LEFT ARROW' to go back or 'RIGHT ARROW' to continue reading \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = false
		get_parent().get_node("Map").visible = false
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").text = "'rising'          'your right leg'          'your left leg'          'and then'          'you moved'"
		Protagonist.get_node("VerbChallenge/VCdescription").visible = true
		Protagonist.get_node("VerbChallenge/VCtextinput").text = "you moved rising your right leg"
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = true
	if page==5:
		your_description.text = "Introduction (5/8)"
		enemy_description.text = "About the UI... This is the map! It has a top down view in which every square is a 'space' inside the room and your current location is represented by the red circle. "
		result.text = "It can be called at any time by holding 'UP ARROW'. "
		world_description.text = "Press 'LEFT ARROW' to go back or 'RIGHT ARROW' to continue reading \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = true
		get_parent().get_node("Map").visible = true
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
	if page==6:
		your_description.text = "Introduction (6/8)"
		enemy_description.text = "About the UI... This is your inventory! It shows what you have in possesion. "
		result.text = "It can be called at any time by holding 'UP ARROW'. "
		world_description.text = "Press 'LEFT ARROW' to go back or 'RIGHT ARROW' to continue reading \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = false
		get_parent().get_node("Map").visible = false
		Protagonist.get_node("Label_Inventory").visible = true
		Protagonist.get_node("Inventory").visible = true
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
	if page==7:
		your_description.text = "Introduction (7/8)"
		enemy_description.text = "About the UI... This is your body! It shows your health. "
		result.text = "It can be called at any time by holding 'UP ARROW'. "
		world_description.text = "Press 'LEFT ARROW' to go back or 'RIGHT ARROW' to continue reading \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = false
		get_parent().get_node("Map").visible = false
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = true
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
	if page==8:
		your_description.text = "Introduction (8/8)"
		enemy_description.text = "Finally... remember that YOU are inside this virtual space, so doing physical effort will drain your 'stamina' therefore rising your 'heart beat' and getting into unconfortable situations will get you stressed therefore draining your 'focus' and distorting your 'vision'. "
		result.text = "Good luck.... "
		world_description.text = "Press 'LEFT ARROW' to go back \nPress 'ENTER' to start game"
		label_event = ""
		#UI
		get_parent().get_node("Label_Map").visible = false
		get_parent().get_node("Map").visible = false
		Protagonist.get_node("Label_Inventory").visible = false
		Protagonist.get_node("Inventory").visible = false
		Protagonist.get_node("Body_Sprites").visible = false
		#Input
		Protagonist.get_node("Label_Verb").visible = false
		Protagonist.get_node("TextInput_Verb").visible = false
		Protagonist.get_node("Label_Connector").visible = false
		Protagonist.get_node("Label_Objective").visible = false
		Protagonist.get_node("TextInput_Objective").visible = false
		Protagonist.get_node("Label_Extra").visible = false
		Protagonist.get_node("TextInput_Extra").visible = false
		Protagonist.get_node("VerbChallenge/VCdescription").visible = false
		Protagonist.get_node("VerbChallenge/VCtextinput").visible = false
		
