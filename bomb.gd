extends Node2D

@export var explosion_scene : PackedScene
var dropped : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not dropped:
		global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("left_click"):
			spawn_explosion()

func spawn_explosion():
	var explosion = explosion_scene.instantiate()
	add_child(explosion)
	explosion.max_radius_reached.connect(_on_max_radius)
	dropped = true

func _on_max_radius():
	Global.weapon_loaded = false
	queue_free()
