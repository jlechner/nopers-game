extends CharacterBody2D

signal fired(posn)

@export var speed = 400
@onready var target = position

func _ready():
	for c in get_children():
		c.can_click_kill = false

func _input(event):
	if event.is_action_pressed("mv_to_cursor"):
		target = get_global_mouse_position()

func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		emit_signal("fired", get_global_mouse_position())

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 10:
		var t = move_and_slide()
	Global.player_position = global_position
