extends Area2D

@export var bullet_hole_scene : PackedScene

var firing_block : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	if Input.is_action_pressed("left_click"):
		if not firing_block:
			firing_block = true
			$FullAutoTimer.start()
			kill_targets()
			make_bullet_hole()
			
	#if Input.is_action_just_released("left_click"):
		#Global.is_firing = false

func kill_targets():
	var areas = get_overlapping_areas()
	for a in areas:
		var parent_of_area = a.get_parent()
		if parent_of_area.has_method("take_damage"):
			parent_of_area.take_damage(0)

func make_bullet_hole():
	var bh = bullet_hole_scene.instantiate()
	bh.global_position = global_position
	add_sibling(bh)

func _on_full_auto_timer_timeout():
	firing_block = false
