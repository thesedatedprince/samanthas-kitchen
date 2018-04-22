extends Node2D

var _timer = null
# class member variables go here, for example:
# var a = 2
var loaded = false

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(3.0)
	_timer.set_one_shot(false)
	_timer.start()

func _process(delta):
	if loaded == true:
		get_tree().change_scene('res://scenes/level2.tscn')
		
		
func _on_Timer_timeout():
	loaded = true