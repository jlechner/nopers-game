extends StaticBody2D

@export var letter_character : String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionLetter.letter_character = letter_character
	$CollisionLetter.make_smashable()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_letter_killed(s):
	queue_free()

func _on_collision_letter_killed(s):
	pass # Replace with function body.


func _on_collision_letter_smashed(kb):
	#$CollisionLetter.kill_letter()
	queue_free()
