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
		"Good afternoon, and welcome to Cooking Mania Madness!",
		"I'm Chef Bob, and I'd like to welcome our special guest...",
		"SAMANTHA'S TIRED EYE!",
		"Let me explain the rules, Samantha's Tired Eye.",
		"There are three chefs, one on each level. You have to make each of us a meal.",
		"To make us a meal, you'll have to find three ingredients, hidden around the floor.",
		"Now, it wouldn't make for good TV if there weren't some challenges along the way, so you'll need to watch out for various traps our producers have set.",
		"The majority of these will just knock you back to where you found the last ingredient.",
		"Most importantly, keep an eye on the stress meter (bottom left).",
		"If this runs out completely, you lose your ingredients and have to restart the level.",
		"You can alleviate stress by drinking a glass of white wine - the perfect way to relax!",
		"OK, boring stuff out of the way. Now for the challenge!",
		"Today, Samantha's Tired Eye will be making us a fresh summer salad!",
		"Sounds incredible! You'll need to find the following ingredients:",
		"A fresh tomato,",
		"Some almonds,",
		"And some freshly laid eggs.",
		"Once you've found them, come back and talk to me (run into me and press space).",
		"And with that, let's get started!",
		"3...",
		"2...",
		"1...",
		"COOKING MANIA MADNESS!!!"
	]
	gui.add_child(d)

