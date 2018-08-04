extends 'res://scripts/enemy.gd'

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const scn_laser = preload('res://scenes/laser_enemy.tscn')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	velocity.x = utils.choose([velocity.x, -velocity.x])
	yield(utils.create_timer(1), 'timeout')
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#bounce on edge
	if position.x <= 0 + 16:
		velocity.x = abs(velocity.x)
	if position.x >= utils.view_size.x - 16:
		velocity.x = -abs(velocity.x)
	pass

func shoot():
	while true:
		var laser = scn_laser.instance()
		laser.position = get_node('cannon').global_position
		utils.main_node.add_child(laser)
		
		yield(utils.create_timer(1.5), 'timeout')
	pass