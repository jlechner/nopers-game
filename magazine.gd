extends Label

signal weapon_loaded(weapon : String)

var loaded_letters = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pivot_offset.x = size.x/2
	global_position = get_global_mouse_position()
	var c : String = ""
	if Input.is_action_just_pressed("a_key"):
		c = "A"
	if Input.is_action_just_pressed("b_key"):
		c = "B"
	if Input.is_action_just_pressed("m_key"):
		c = "M"
	if Input.is_action_just_pressed("o_key"):
		c = "O"
		
	if c != "":
		#print(size.x)
		#print(pivot_offset.x)
		loaded_letters += c
	
	if Input.is_action_just_pressed("space_key"):
		emit_signal("weapon_loaded", loaded_letters)
		loaded_letters = ""
	
	text = loaded_letters
