extends Sprite2D

var ok  = true

func _process(delta):
	if ok:
		ok = false
		move()

func move():
	randomize()
	
	var move_x = randi_range(-6,6)
	var move_y = randi_range(-6,6)
	
	print ("x : "+ str(move_x))
	print ("y : "+ str(move_y))

	if self.flip_h == false and move_y > 0 : 
		self.flip_h = true
	elif self.flip_h == true and move_y < 0:
		self.flip_h = false
		

	var tween = get_tree().create_tween()
	tween.tween_property(self, "position",Vector2(move_x, move_y), 1.0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	await tween.finished

	await get_tree().create_timer(randi_range(0,3)).timeout
	ok = true

