extends Area2D

signal max_radius_reached

var MAX_SCALE = 20
var growing : bool = true
var damaged = []
var damage_amount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if growing:
		scale = scale*(1+10*delta)
		if scale.length() > MAX_SCALE:
			growing = false
			emit_signal("max_radius_reached")

#
#func _on_body_entered(body):
	#var bodies = get_overlapping_bodies()
	#for b in bodies:
		#var body_id = b.get_instance_id()
		#if body_id not in damaged:
			#damaged.append(body_id)
			#if b.has_method("take_damage"):
				#b.take_damage(damage_amount)
#

func _on_area_entered(area):
	var areas = get_overlapping_areas()
	for a in areas:
		a.explode(global_position)
		var area_id = a.get_instance_id()
		#var parent_of_area = a.get_parent()
		if area_id not in damaged:
			damaged.append(area_id)
			#if parent_of_area.has_method("take_damage"):
				#parent_of_area.take_damage(damage_amount)
