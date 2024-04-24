extends CharacterWord

var mob_speed = 25.0

func _physics_process(delta):
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	var direction = (Global.player_position - global_position).normalized()
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
