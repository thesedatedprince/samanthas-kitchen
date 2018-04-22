extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("body_entered", self, "_on_body_enter")

func _on_body_enter(body):
	if body.name == 'Player':
		var sanity = get_tree().get_root().find_node("Sanity", true, false)
		var hit = get_tree().get_root().find_node("WinePlayer", true, false)
		hit.play(0)
		sanity.value = 100
		self.queue_free()