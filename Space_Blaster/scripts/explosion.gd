extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	rotation = deg2rad(rand_range(0, 360))
	get_node('anim').play('fade_out')
	yield(get_node('anim'), 'animation_finished')
	queue_free()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass