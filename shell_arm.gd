extends Node2D

var damaged = []
var damage_amount = 1
var valid_hit = false

@export var shell_arm_letter : String = "S"

# Called when the node enters the scene tree for the first time.
func _ready():
	$LetterArea/CollisionLetter.letter_character = shell_arm_letter

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	var bodies = $LetterArea.get_overlapping_bodies()
	for b in bodies:
		var body_id = b.get_instance_id()
		if body_id not in damaged:
			damaged.append(body_id)
			if b.has_method("take_damage"):
				valid_hit = true
				b.take_damage(damage_amount)
	if valid_hit:
		queue_free()
