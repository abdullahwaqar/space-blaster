extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#[x] apply velocity
#[x] instantiate a flare
#[x] self-destroy when out of screen

export var velocity = Vector2()
const scn_flare = preload('res://scenes/flare.tscn')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	create_flare()
	
	yield(get_node('vis_notifier'), 'tree_exited')
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	translate(velocity * delta)
	pass

func create_flare():
	var flare = scn_flare.instance()
	flare.position = position
	utils.main_node.add_child(flare)
	pass