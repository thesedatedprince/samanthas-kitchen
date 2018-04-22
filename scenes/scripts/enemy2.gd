extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var angry = false
var _timer = null
var angryskin = preload('res://assets/sprites/enemies/enemy2a.png')
var niceskin = preload('res://assets/sprites/enemies/enemy2b.png')
var entered = false

func _ready():
	connect("body_entered", self, "_on_body_enter")
	connect("body_exited", self, "_on_body_exit")

	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(3.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

func _physics_process(delta):
	if (entered == true) && (angry == true):
		var player = get_tree().get_root().find_node("Player", true, false)
		var hit = get_tree().get_root().find_node("HitPlayer", true, false)
		hit.play(0)
		player.position = player.checkpoint

func _on_body_enter(body):
	if body.name == 'Player':
		entered = true;

func _on_body_exit(body):
	if body.name == 'Player':
		entered = false;	
		
func _on_Timer_timeout():
	var sprite = self.find_node("GoodSprite", true, false)
	if angry == false:
		sprite.texture = angryskin
		angry = true
	else:
		sprite.texture = niceskin
		angry = false
		