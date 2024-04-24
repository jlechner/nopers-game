extends Node

signal player_haste_cast

var player_position : Vector2 = Vector2.ZERO

var ammo_dict = {'A':0,'B':0,'C':0,'D':0,'E':0,'F':0,'G':0,'H':0,'I':0,'J':0,'K':0,'L':0,'M':0,'N':0,'O':0,'P':0,'Q':0,'R':0,'S':0,'T':0,'U':0,'V':0,'W':0,'X':0,'Y':0,'Z':0}
var loaded_letters : String = ""
var weapon_loaded : bool = false

var is_firing : bool = false

func _on_letter_killed(s: String):
	s = s.to_upper()
	ammo_dict[s] += 1
	update_loaded_letters()
	#loaded_letters += s
	#print(ammo_dict)

func cast_haste():
	emit_signal("player_haste_cast")

func take_letters(s : String):
	for c in s:
		ammo_dict[c] += 1
	update_loaded_letters()

func update_loaded_letters():
	loaded_letters = ""
	for a in ammo_dict:
		loaded_letters = loaded_letters + a + ": " + str(ammo_dict[a]) + " - "

# Called when the node enters the scene tree for the first time.
func _ready():
	update_loaded_letters()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
