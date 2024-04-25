extends CollisionShape2D

signal killed(s: String)

@export var letter_character : String = ""
var width: float
var can_click_kill = true

var letter_killed : bool = false

func set_letter(c) -> void:
	letter_character = c

func get_width() -> float:
	return width

func disable_click_kill():
	can_click_kill = false

func take_damage(dmg_amt : int) -> void:
	kill_letter()

# Called when the node enters the scene tree for the first time.
func _ready():
	width = $RightBound.position.x - $LeftBound.position.x
	killed.connect(Global._on_letter_killed)
	killed.connect(get_parent()._on_letter_killed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = letter_character
#
#func _on_area_2d_input_event(viewport, event, shape_idx):
	#if Global.weapon_loaded:
		#return
#
	#if event.is_pressed():
		#if can_click_kill:
			## TODO: should have different behaviors here being set based on parent word
			#kill_letter()

func kill_letter():
	if can_click_kill and not letter_killed:
		letter_killed = true
		emit_signal("killed", letter_character)
		queue_free()


#func _on_area_2d_mouse_entered():
	#if can_click_kill and not letter_killed:
		#if Global.is_firing:
			## TODO: should have different behaviors here being set based on parent word
			#letter_killed = true
			#kill_letter()
