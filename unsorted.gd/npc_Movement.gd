extends Sprite2D

var InitPos_x : float
var InitPos_y : float

var randbool : bool = true


func _ready() -> void:
	InitPos_x = self.get_position().x
	InitPos_y = self.get_position().y
	move()




func move():
	randomize()
	var move_x = randi_range(-8,8) +InitPos_x
	var move_y = randi_range(-8,8) +InitPos_y
	
	# imagine it as an invisible fence around there 
	position.x = clamp(position.x, InitPos_x + -8 ,InitPos_x + 8)
	
	position.y = clamp(position.y,InitPos_y + -8 ,InitPos_y + 8)
	
	#if self.flip_h == false and move_x > 0 : 
		#self.flip_h = true
#
	#elif self.flip_h and move_x < 0:
		#self.flip_h = false
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position",Vector2(move_x, move_y), 1.0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	
	await get_tree().create_timer(randi_range(0,3)).timeout
	move()

