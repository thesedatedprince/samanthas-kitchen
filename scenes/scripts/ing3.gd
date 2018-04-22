extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("body_entered", self, "_on_body_enter")

func _on_body_enter(body):
	if body.name == 'Player':
		var player = get_tree().get_root().find_node("Player", true, false)
		var hit = get_tree().get_root().find_node("IngPlayer", true, false)
		hit.play(0)
		player.has_ing3 = true
		player.checkpoint = player.position
		self.queue_free()