extends KinematicBody2D

var screensize

var has_ing1 = false
var has_ing2 = false
var has_ing3 = false
var has_ing4 = false
var has_ing5 = false
var has_ing6 = false
var has_ing7 = false
var has_ing8 = false
var has_ing9 = false

var dialogue = load("res://scenes/gui/DialogueBox.tscn")

var checkpoint

export (int) var speed = 5

var velocity = Vector2()

func _ready():
	screensize = get_viewport_rect().size
	checkpoint = self.position
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	var collision = move_and_collide(velocity)
	if collision:
		if (collision.collider.name == 'npc') && Input.is_action_just_released('ui_accept'):
			var gui = get_tree().get_root().find_node("GUI", true, false)
			var d = dialogue.instance()
			var text
			
			if (self.has_ing1 == true) && (self.has_ing2 == true) && (self.has_ing3 == true):
				text = d.find_node("text", true, false)
				text.dialogue = [
					"Congratulations, you have found the ingredients!",
					"Mmmm... this salad looks delicious.",
					"Fresh, crisp... the eggs look boiled to perfection.",
					"The dressing is sharp and refreshing, like a mouthful of spring sunshine",
					"...my lips feel numb.",
					"My throat starts to swell... my chest crumples like a blocked, empty vacuum bag...",
					"The last time I felt like this I was five years old.",
					"The blue lights, the siren... the injection into my heart...",
					"The panic of life returning.",
					"Oh, Samantha... what have you done?"
				]
				text.end_level = true
				text.next_level = "res://scenes/maincourse.tscn"
				gui.add_child(d)
				
			else:
				text = d.find_node("text", true, false)
				text.dialogue = []
				if self.has_ing1 == false:
					text.dialogue.append("We're still missing a fresh tomato")
				if self.has_ing2 == false:
					text.dialogue.append("We're still missing almonds")
				if self.has_ing3 == false:
					text.dialogue.append("We're still missing newly-laid eggs")
				gui.add_child(d)
				
		if (collision.collider.name == 'npc2') && Input.is_action_just_released('ui_accept'):
			var gui = get_tree().get_root().find_node("GUI", true, false)
			var d = dialogue.instance()
			var text
			
			if (self.has_ing4 == true) && (self.has_ing5 == true) && (self.has_ing6 == true):
				text = d.find_node("text", true, false)
				text.dialogue = [
					"OK, lets get a taste of this toad-in-the-hole!",
					"Nicely spiced sausages, good quality gravy...",
					"A perfect winter treat!",
					"The needle catches in my throat.",
					"With choking, racking coughs I stare at you.",
					"Blood hits the table with every convulsion, and you...",
					"...you just smiled at me, Samantha.",
					"Oh Samantha... what have you done?"
				]
				text.end_level = true
				text.next_level = "res://scenes/dessert.tscn"
				gui.add_child(d)
				
			else:
				text = d.find_node("text", true, false)
				text.dialogue = []
				if self.has_ing4 == false:
					text.dialogue.append("We're still missing fresh butcher's sausages.")
				if self.has_ing5 == false:
					text.dialogue.append("We're still missing new potatoes.")
				if self.has_ing6 == false:
					text.dialogue.append("We're still missing a sewing needle...")
				gui.add_child(d)
				
		if (collision.collider.name == 'npc3') && Input.is_action_just_released('ui_accept'):
			var gui = get_tree().get_root().find_node("GUI", true, false)
			var d = dialogue.instance()
			var text
			
			if (self.has_ing7 == true) && (self.has_ing8 == true) && (self.has_ing9 == true):
				text = d.find_node("text", true, false)
				text.dialogue = [
					"Why?",
					"Weren't you happy with us?",
					"I know we could be ungrateful, needy, but still...",
					"...did we really deserve this?",
					"Fortunately, I can't remember my death.",
					"I heard Dad croaking for Epinephrine,",
					"And sister making sounds like a bubbling treacle waterfall",
					"Samantha. Why did you you do this?",
					"Didn't we love you enough?"
				]
				text.end_level = true
				text.next_level = "res://scenes/end.tscn"
				gui.add_child(d)
				
			else:
				text = d.find_node("text", true, false)
				text.dialogue = []
				if self.has_ing7 == false:
					text.dialogue.append("We're still missing sleeping pills to stop me struggling.")
				if self.has_ing8 == false:
					text.dialogue.append("We're still missing duct tape to hold the bag in place.")
				if self.has_ing9 == false:
					text.dialogue.append("We're still missing the shopping bag to asphyxiate me.")
				gui.add_child(d)

