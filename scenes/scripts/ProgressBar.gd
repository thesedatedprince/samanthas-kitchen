extends ProgressBar

var dialogue = load("res://scenes/gui/DialogueBox.tscn")
var _timer = null


func _ready():
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	self.value -= 1;
	if self.value <= 0:
		var player = get_tree().get_root().find_node("Player", true, false)
		var gui = get_tree().get_root().find_node("GUI", true, false)
		var hit = get_tree().get_root().find_node("DeathPlayer", true, false)
		hit.play(0)
		var d = dialogue.instance()
		var text = d.find_node("text", true, false)
		text.dialogue = ["Samantha became too stressed to function"]
		text.player_dead = true
		gui.add_child(d)
