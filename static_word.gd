class_name StaticWord
extends StaticBody2D

@export var text : String
@export var letter_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	if text:
		init(text)

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
