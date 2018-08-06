extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var armor = 2 setget set_armor
export var velocity = Vector2()

const scn_explosion = preload('res://scenes/explosion.tscn')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	add_to_group('enemy')
	connect('area_entered', self, '_on_area_enter')
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	translate(velocity * delta)
	
	if position.y - 16 >= get_viewport_rect().size.y:
		queue_free()
	pass

func set_armor(val):
	if is_queued_for_deletion():
		return
	armor = val
	if armor <= 0:
		utils.find_node('tex_score').score += 5
		create_explosion()
		queue_free()
	pass
	
func _on_area_enter(other):
	if other.is_in_group('ship'):
		other.armor -= 1
		queue_free()
	pass

func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.position = position
	utils.main_node.add_child(explosion)
	pass