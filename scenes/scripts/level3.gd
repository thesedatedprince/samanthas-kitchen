extends Node2D

var dialogue = load("res://scenes/gui/DialogueBox.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var gui = get_tree().get_root().find_node("GUI", true, false)
	var d = dialogue.instance()
	var text = d.find_node("text", true, false)
	text.dialogue = [
		"...the ingredients you'll need are as follows:",
		"One bottle of sleeping pills,",
		"One roll of duct tape,",
		"One shopping bag.",
		"...",
		"You're disgusting."
	]
	gui.add_child(d)