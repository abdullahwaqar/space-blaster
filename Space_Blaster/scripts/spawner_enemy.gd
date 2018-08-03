extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const enemy_kamikaze = preload('res://scenes/enemy_kamikaze.tscn')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	spawn()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func spawn():
	while true:
		randomize()
		var enemy = enemy_kamikaze.instance()
		var pos = Vector2()
		pos.x = rand_range(0 + 16, get_viewport().get_visible_rect().size.x - 16)
		pos.y = 0 - 16
		enemy.position = pos
		get_node('container').add_child(enemy)
		yield(utils.create_timer(rand_range(0.5, 1.25)), 'timeout')
	pass