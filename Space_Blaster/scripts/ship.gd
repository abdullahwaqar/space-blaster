extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	var motion = (get_global_mouse_position().x - position.x) * 0.2
	translate(Vector2(motion, 0))
	
	#clamp to view
	var view_size = get_viewport_rect().size.x
	var pos = position
	pos.x = clamp(pos.x, 0 + 16, view_size - 16) 
	position = pos
	pass
