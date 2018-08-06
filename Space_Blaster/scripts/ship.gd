extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const scn_laser = preload('res://scenes/laser_ship.tscn')
const scn_explosion = preload('res://scenes/explosion.tscn')
const scn_flash = preload('res://scenes/flash.tscn')

var armor = 4 setget set_armor

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	add_to_group('ship')
	
	yield(utils.create_timer(0.5), 'timeout')
	shoot()
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

func shoot():
	while true:
		var pos_left = get_node('cannons/left').global_position
		var pos_right = get_node('cannons/right').global_position
		create_laser(pos_left)
		create_laser(pos_right)
		yield(utils.create_timer(0.25), 'timeout')
	pass

func set_armor(val):
	if val < armor:
		utils.main_node.add_child(scn_flash.instance())
	armor = val
	if armor <= 0:
		create_explosion()
		queue_free()
	pass

func create_laser(pos):
	var laser = scn_laser.instance()
	laser.position = pos
	utils.main_node.add_child(laser)
	pass
	
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.position = position
	utils.main_node.add_child(explosion)
	pass