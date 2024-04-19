class_name CharacterWord
extends CharacterBody2D

var SPEED = 50.0
@export var text : String
@export var letter_scene: PackedScene

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
	orient()

func orient():
	var buffer = 1
	var childs = get_children()
	var init_posn = global_position
	var next_posn = init_posn
	for c in childs:
		c.global_position = next_posn
		next_posn.x += (scale.x*c.get_width())+buffer

#func _physics_process(delta):
	### Get the input direction and handle the movement/deceleration.
	### As good practice, you should replace UI actions with custom gameplay actions.
	##var direction = Input.get_axis("ui_left", "ui_right")
	##if direction:
		##velocity.x = direction * SPEED
	##else:
		##velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
