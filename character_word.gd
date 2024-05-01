class_name CharacterWord
extends CharacterBody2D

var SPEED = 50.0
@export var text : String
@export var letter_scene: PackedScene
var total_letters : int = 0

func take_damage(dmg_amt : int) -> void:
	print("damaged")

# Called when the node enters the scene tree for the first time.
func _ready():
	if text:
		init(text)
	velocity = SPEED*Vector2.DOWN

func init(s):
	for l in s:
		var letter = letter_scene.instantiate()
		letter.set_letter(l)
		add_child(letter)
		letter.killed.connect(_on_letter_killed)
		total_letters += 1
	orient()

func orient():
	var buffer = 1
	var childs = get_child_letters()
	var init_posn = global_position
	var next_posn = init_posn
	for c in childs:
		c.global_position = next_posn
		next_posn.x += (scale.x*c.get_width())+buffer

func get_child_letters():
	var letter_children = []
	for c in get_children():
		if c.has_method("disable_click_kill"):
			letter_children.append(c)
	return letter_children

func _on_letter_killed(s):
	total_letters -= 1
	print(total_letters)
	if total_letters <= 0:
		queue_free()
