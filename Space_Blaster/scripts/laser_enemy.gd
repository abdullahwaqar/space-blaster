extends 'res://scripts/laser.gd'

# class member variables go here, for example:
# var a = 2

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect('area_entered', self, '_on_area_enter')
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_area_enter(other):
	if other.is_in_group('ship'):
		other.armor -= 1
		create_flare()
		utils.remote_call('camera', 'shake', 3, 0.13)
		queue_free()
	pass