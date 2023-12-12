extends Camera2D

var shake_time = 0.0
var shake_intensity = 10.0

func _physics_process(delta):
	if shake_time > 0:
		offset = Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity)
		)
		shake_time -= delta
	else:
		offset = Vector2(0, 0)

func shake(duration, intensity):
	shake_time = duration
	shake_intensity = intensity
