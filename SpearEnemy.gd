extends CharacterWord

var spear_windup_speed = 15.0
var stab_speed = 2000.0
var stabbing : bool = false

func aim() -> Vector2:
	var direction = (Global.player_position - global_position).normalized()
	rotation = direction.angle()
	return direction

func windup():
	var dir : Vector2 = aim()
	velocity = -spear_windup_speed * dir

func _physics_process(delta):
	move_and_slide()
	if not stabbing:
		windup()

func _on_stab_timer_timeout():
	stabbing = false

func stab():
	stabbing = true
	velocity = stab_speed * aim()
	$StabTimer.start()

func _on_wind_up_timer_timeout():
	stab()
	$WindUpTimer.start()
