extends Marker2D

@export var enemy_scene : PackedScene
@export var is_mob : bool = false

func make_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.global_position = global_position
	if is_mob:
		var word = ""
		for i in range(4):
			word += Global.get_random_letter()
		enemy.text = word
	add_sibling(enemy)

func _on_respawn_timer_timeout():
	make_enemy()
