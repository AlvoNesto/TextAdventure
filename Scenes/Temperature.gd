extends Node

func _ready():
	get_node("Cold").visible = true
	get_node("Hot").visible = true

func _process(delta):
	if get_parent().Temperature>0:
		get_node("Hot").modulate.a = abs(get_parent().Temperature/100.0)
		get_node("Cold").modulate.a = 0
	if get_parent().Temperature<0:
		get_node("Hot").modulate.a = 0
		get_node("Cold").modulate.a = abs(get_parent().Temperature/100.0)
	if get_parent().Temperature==0:
		get_node("Hot").modulate.a = 0
		get_node("Cold").modulate.a = 0
