extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var velocity = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	translate(velocity * delta)
	
	if position.y >= get_viewport_rect().size.y:
		position = Vector2(0, -180)
	pass
