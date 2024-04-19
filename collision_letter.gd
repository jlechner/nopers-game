extends CollisionShape2D

signal killed(s: String)

@export var letter_character : String = ""
var width: float
var can_click_kill = true

func set_letter(c) -> void:
	letter_character = c

func get_width() -> float:
	return width

# Called when the node enters the scene tree for the first time.
func _ready():
	width = $RightBound.position.x - $LeftBound.position.x
	killed.connect(Global._on_letter_killed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = letter_character

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Global.weapon_loaded:
		return

	if event.is_pressed():
		if can_click_kill:
			# TODO: should have different behaviors here being set based on parent word
			emit_signal("killed", letter_character)
			queue_free()
