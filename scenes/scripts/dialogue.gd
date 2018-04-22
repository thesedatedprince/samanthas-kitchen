extends RichTextLabel

var dialogue = ["Test dialogue 1", "Another dialogue set"]
var page = 0
var end_level = false
var next_level
var player_dead = false

func _ready():
	get_tree().paused = true
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if Input.is_action_just_released('ui_accept'):
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size() - 1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			else:
				var parent = get_tree().get_root().find_node("DialogueBox", true, false)
				get_tree().paused = false
				if end_level == true:
					get_tree().change_scene(next_level)
				elif player_dead == true:
					get_tree().reload_current_scene()
				parent.queue_free()
		else:
			set_visible_characters(get_total_character_count())


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
