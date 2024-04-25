extends CharacterWord

var base_speed = 25.0
var knockback_speed = 800.0
var mob_speed = base_speed
var knocked_back : bool = false
var target : Vector2

func _physics_process(delta):
	if not knocked_back:
		target = Global.player_position
		
	var direction = (target - global_position).normalized()
	velocity = direction * mob_speed
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func take_damage(dmg_amt : int) -> void:
	return ##################
	Global.take_letters(text)
	queue_free()

func is_an_enemy():
	return true

func apply_knockback():
	var kb_length = 1000.0
	var kb_dir : Vector2 = (global_position - Global.player_position).normalized()
	target = global_position + kb_length*kb_dir
	mob_speed = knockback_speed
	knocked_back = true
	$KnockbackTimer.start()

func _on_knockback_timer_timeout():
	mob_speed = base_speed
	knocked_back = false
