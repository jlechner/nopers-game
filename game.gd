extends Node2D

func _ready():
	#$MainMenu/WinMessage.hide()
	$GeneratorTestLevel.pause_level()

func _process(delta):
	$Health.text = str(Global.player_health)
	if Global.score >= 10:
		$MainMenu.show()
		$MainMenu/WinMessage.show()
		$GeneratorTestLevel.pause_level()
	
	if Global.player_health <= 0:
		$MainMenu.show()
		$MainMenu/LoseMessage.show()
		$GeneratorTestLevel.pause_level()
		
	if Input.is_action_just_pressed("menu_key"):
		$GeneratorTestLevel.pause_level()
		$MainMenu.show()


func _on_start_button_pressed():
	$GeneratorTestLevel.un_pause_level()
	$MainMenu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#$GeneratorTestLevel.un_pause_level()


func _on_start_button_button_down():
	print("button down")
