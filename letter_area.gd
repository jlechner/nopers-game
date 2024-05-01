extends Area2D

signal shot
signal exploded(epicenter : Vector2)
signal touched(killed: bool)
signal smashed(knocked_back : bool)

func shoot():
	emit_signal("shot")

func explode(epicenter_coords : Vector2):
	emit_signal("exploded", epicenter_coords)

func touch(killed: bool):
	emit_signal("touched", killed)

func smash(knocked_back : bool):
	emit_signal("smashed", knocked_back)
