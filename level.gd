extends Node2D

#var weapon_mapping = {
	#'BOMB': bomb_scene
#}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		#_on_magazine_weapon_loaded(Global.loaded_letters)
		#Global.loaded_letters = ""

#
#func _on_magazine_weapon_loaded(weapon : String):
	#var weapon_scene : PackedScene
	#match weapon:
		#"BOMB":
			#weapon_scene = bomb_scene
		#_:
			#print("TYPO")
			#return
#
	#var weapon_instance = weapon_scene.instantiate()
	#add_child(weapon_instance)
	#Global.weapon_loaded = true
