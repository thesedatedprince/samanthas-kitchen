extends Area2D

export (int) var speed = 5
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var _timer = null
export (bool) var start_left = true
export (bool) var start_right
export (bool) var start_up
export (bool) var start_down


var velocity = Vector2()
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var direction

var final_position = self.position
var moving = false

func _ready():
	connect("body_entered", self, "_on_body_enter")
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(3.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

	if start_left == true:
		direction = left
	elif start_right == true:
		direction = right
	elif start_up == true:
		direction = up
	else:
		direction = down
		
func _physics_process(delta):
	if (direction == left && self.position.x <= final_position.x) && moving == true:
		moving = false
		velocity = Vector2()
		direction = right
	if (direction == right && self.position.x >= final_position.x) && moving == true:
		moving = false
		velocity = Vector2()
		direction = left
	if (direction == up && self.position.y <= final_position.y) && moving == true:
		moving = false
		velocity = Vector2()
		direction = down
	if (direction == down && self.position.y >= final_position.y) && moving == true:
		moving = false
		velocity = Vector2()
		direction = up
	elif moving == true:
		velocity = direction.normalized() * speed
		self.position += velocity

	elif self.position.y <= final_position.y:
		velocity = Vector2()
		moving = false

func _on_body_enter(body):
	if body.name == 'Player':
		var sanity = get_tree().get_root().find_node("Sanity", true, false)
		var hit = get_tree().get_root().find_node("DrainPlayer", true, false)
		hit.play(0)
		sanity.value -= 20
		

func _on_Timer_timeout():
	if direction == left || direction == up:
		final_position = self.position - get_node('Sprite').texture.get_size()
	if direction == right || direction == down:
		final_position = self.position + get_node('Sprite').texture.get_size()

	moving = true