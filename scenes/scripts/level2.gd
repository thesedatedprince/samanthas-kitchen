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
		"Welcome back to Cooking Mania Madness!",
		"I'm Chef Michelle!",
		"I should warn you, I'm much harder to please than Chef Bob,",
		"He's just passive aggressive, I'm a bit more vocal, you know?",
		"Anyway, for the main course, you'll be making the British classic, toad-in-the-hole!",
		"Very fattening. Are you sure you want to be making that?",
		"Anyway, the ingredients you'll need are as follows...",
		"One pack of sausages!",
		"Some potatoes!",
		"One sewing needle!",
		"...",
		"...",
		"Ok, one sewing needle it is. Are you ready?",
		"3...",
		"2...",
		"1...",
		"COOKING MANIA MADNESS!"
	]
	gui.add_child(d)