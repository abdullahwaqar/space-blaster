extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var magnitude = 0
var time_left = 0
var is_shaking = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func shake(new_magnitutde, lifetime):
	if magnitude > new_magnitutde:
		return
	
	magnitude = new_magnitutde
	time_left = lifetime
	
	if is_shaking:
		return
	
	is_shaking = true
	while time_left > 0:
		var pos =  Vector2()
		pos.x = rand_range(-magnitude, magnitude)
		pos.y = rand_range(-magnitude, magnitude)
		position = pos
		
		time_left -= get_process_delta_time()
		yield(get_tree(), 'idle_frame')
	
	magnitude = 0
	is_shaking = false
	position = Vector2(0, 0)
	pass