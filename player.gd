extends CharacterBody2D

@export var bomb_scene : PackedScene
@export var shell_scene : PackedScene

signal fired(posn)

@export var normal_speed = 400
var speed = normal_speed
@export var haste_speed = 700
@onready var target = position

var firing_block : bool = false

func _ready():
	for c in get_children():
		if c.has_method("disable_click_kill"):
			c.disable_click_kill()

func _process(delta):
	if Input.is_action_pressed("left_click"):
		Global.is_firing = true
		#if not firing_block:
			#firing_block = true
			#$FullAutoTimer.start()
			#emit_signal("fired", get_global_mouse_position())
	if Input.is_action_just_released("left_click"):
		Global.is_firing = false

	if Input.is_action_just_pressed("right_click"):
		make_weapons()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func make_weapons():
	var big_weapon = []
	var big_weapon_letters = {'A':0,'B':0,'C':0,'D':0,'E':0,'F':0,'G':0,'H':0,'I':0,'J':0,'K':0,'L':0,'M':0,'N':0,'O':0,'P':0,'Q':0,'R':0,'S':0,'T':0,'U':0,'V':0,'W':0,'X':0,'Y':0,'Z':0}

	const bomb_letters = {'B': 2, 'O': 1, 'M': 1}
	const haste_letters = {'A': 1, 'E': 1, 'H':1, 'S': 1, 'T': 1}
	const bolt_letters = {'A':1, 'B':1, 'O':3}
	const shell_letters = {'E':1, 'H': 1, 'L':2, 'S': 1}
	const weapons = {'BOMB': bomb_letters, 'HASTE': haste_letters, 'SHELL': shell_letters}

	for w in weapons:
		var weapon_fulfilled : bool = true
		var weapon = weapons[w]
		for letter in weapon:
			if Global.ammo_dict[letter] < weapon[letter]:
				print("unfulfilled")
				weapon_fulfilled = false
				break
		if weapon_fulfilled:
			big_weapon.append(w)
			for letter in weapon:
				if big_weapon_letters[letter] < weapon[letter]:
					big_weapon_letters[letter] = weapon[letter]

	print(big_weapon)
	print(big_weapon_letters)

	for letter in big_weapon_letters:
		Global.ammo_dict[letter] -= big_weapon_letters[letter]
		Global.update_loaded_letters()

	for bw in big_weapon:
		match bw:
			"BOMB":
				print("makign bonb")
				make_bomb()
			"SHELL":
				print("makign shell")
				make_shell()
			"HASTE":
				print("casting haste")
				cast_haste()
			#_:
				#print("TYPO")

func make_bomb():
	var weapon_scene : PackedScene = bomb_scene
	var weapon_instance = weapon_scene.instantiate()
	add_child(weapon_instance)

func make_shell():
	var weapon_scene : PackedScene = shell_scene
	var weapon_instance = weapon_scene.instantiate()
	add_child(weapon_instance)

func cast_haste():
	print("sppedy")
	speed = haste_speed
	$HasteTimer.start()

func _physics_process(delta):
	get_input()
	move_and_slide()
	if is_on_wall():
		var c = get_last_slide_collision()
		$CollisionChecker.global_position = c.get_position()
		var areas = $CollisionChecker.get_overlapping_areas()
		for a in areas:
			var area_id = a.get_instance_id()
			var parent_of_area = a.get_parent()
			if parent_of_area.has_method("take_damage"):
				parent_of_area.take_damage(0)
		
	Global.player_position = global_position


func _on_haste_timer_timeout():
	speed = normal_speed

func _on_full_auto_timer_timeout():
	firing_block = false
