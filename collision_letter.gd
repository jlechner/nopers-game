extends CollisionShape2D

signal killed(s: String)
signal exploded(epicenter_posn : Vector2)
signal touched(s : String)
signal smashed(kb : bool)

@export var letter_character : String = ""
var width: float
var can_click_kill : bool = true
var preserve : bool = false

var letter_killed : bool = false

func set_letter(c) -> void:
	letter_character = c

func get_width() -> float:
	return width

func disable_click_kill():
	can_click_kill = false

func make_preservable():
	preserve = true

func make_touchable():
	$LetterArea.set_collision_layer_value(Global.TOUCH_MASK, true)

func make_smashable():
	$LetterArea.set_collision_layer_value(Global.SMASH_MASK, true)
	
func take_damage(dmg_amt : int) -> void:
	kill_letter()

# Called when the node enters the scene tree for the first time.
func _ready():
	width = $RightBound.position.x - $LeftBound.position.x
	killed.connect(Global._on_letter_killed)
	#killed.connect(get_parent()._on_letter_killed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = letter_character

func kill_letter():
	if can_click_kill and not letter_killed:
		letter_killed = true
		emit_signal("killed", letter_character)
		queue_free()

func _on_letter_area_shot():
	kill_letter()

func _on_letter_area_exploded(epicenter):
	emit_signal("exploded",epicenter)
	kill_letter()

func _on_letter_area_touched(killed : bool):
	emit_signal("touched", letter_character)
	if killed and not preserve:
		kill_letter()
		
	if preserve:
		disable_letter()

func disable_letter():
	set_deferred("disabled", true)
	
func enable_letter():
	set_deferred("disabled", false)


func _on_letter_area_smashed(knocked_back):
	emit_signal("smashed", knocked_back)
	kill_letter()
