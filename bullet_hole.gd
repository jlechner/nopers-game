extends Sprite2D

var scale_shrink_rate = 0.05
var minimum_scale = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale = scale - Vector2(scale_shrink_rate*delta, scale_shrink_rate*delta)
	if scale.length_squared() < minimum_scale:
		queue_free()
