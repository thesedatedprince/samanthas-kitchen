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
		"I don't know whether it was pressure, insanity, or just plain cruelty",
		"But I enjoyed it, I really did.",
		"It was the best meal I've ever prepared"
	]
	text.end_level = true
	text.next_level = "res://scenes/start.tscn"
	gui.add_child(d)