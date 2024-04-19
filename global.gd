extends Node

var player_position : Vector2 = Vector2.ZERO

var ammo_dict = {'A':0,'B':0,'E':0,'O':0,'M':0}
var loaded_letters = ""
var weapon_loaded : bool = false

func _on_letter_killed(s: String):
	s = s.to_upper()
	ammo_dict[s] += 1
	print(ammo_dict)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
