extends Node2D

func pause_level():
	get_tree().paused = true

func un_pause_level():
	get_tree().paused = false
