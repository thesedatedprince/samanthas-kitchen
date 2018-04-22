extends KinematicBody2D

var horizontal = preload('res://assets/sprites/enemies/enemy1r.png')
var front = preload('res://assets/sprites/enemies/enemy1f.png')
var back = preload('res://assets/sprites/enemies/enemy1b.png')

export (int) var speed = 5

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

func _ready():
	var sprite = self.find_node("Sprite", true, false)
	if start_left == true:
		direction = left
	elif start_right == true:
		direction = right
	elif start_up == true:
		direction = up
		sprite.texture = back
	else:
		direction = down
		sprite.texture = front


func _physics_process(delta):


	velocity = direction.normalized() * speed

	var collision = move_and_collide(velocity)
	if collision:
		if collision.collider.name == 'TileMap':
			var sprite = self.find_node("Sprite", true, false)
			if direction == right:
				direction = left
				sprite.flip_h = true
			elif direction == left:
				direction = right
				sprite.flip_h = false
			elif direction == down:
				direction = up
				sprite.texture = back
			elif direction == up:
				direction = down
				sprite.texture = front
				
		if collision.collider.name == 'Player':
			var player = get_tree().get_root().find_node("Player", true, false)
			var hit = get_tree().get_root().find_node("HitPlayer", true, false)
			hit.play(0)
			player.position = player.checkpoint
	