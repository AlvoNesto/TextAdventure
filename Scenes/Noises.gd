extends Node

onready var Protagonist = get_parent().get_node("Protagonist")

var activateNoises = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if activateNoises == true:
		if Protagonist.Focus>75:
			while get_child_count()>1:
				var noise = get_child(0)
				remove_child(noise)
				noise.queue_free()
			while get_child_count()<1:
				var noise = load("res://Scenes/Noise.tscn")
				var newnoise = noise.instance()
				add_child(newnoise)
				newnoise.position.x=200
				newnoise.position.y=200
		elif Protagonist.Focus>50:
			while get_child_count()>2:
				var noise = get_child(0)
				remove_child(noise)
				noise.queue_free()
			while get_child_count()<2:
				var noise = load("res://Scenes/Noise.tscn")
				var newnoise = noise.instance()
				add_child(newnoise)
				newnoise.position.x=200
				newnoise.position.y=200
		elif Protagonist.Focus>25:
			while get_child_count()>3:
				var noise = get_child(0)
				remove_child(noise)
				noise.queue_free()
			while get_child_count()<3:
				var noise = load("res://Scenes/Noise.tscn")
				var newnoise = noise.instance()
				add_child(newnoise)
				newnoise.position.x=200
				newnoise.position.y=200
		else:
			while get_child_count()>4:
				var noise = get_child(0)
				remove_child(noise)
				noise.queue_free()
			while get_child_count()<4:
				var noise = load("res://Scenes/Noise.tscn")
				var newnoise = noise.instance()
				add_child(newnoise)
				newnoise.position.x=200
				newnoise.position.y=200
