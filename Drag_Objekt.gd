extends Node2D
var draggable = false
var is_inside_dropble = false
var body_ref
var offset: Vector2
var initial_pos: Vector2
var dub = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initial_pos = global_position
			offset = get_viewport().get_mouse_position()
			GlobalPass.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_viewport().get_mouse_position()
		elif Input.is_action_just_released("click"):
			GlobalPass.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropble:
				tween.tween_property(self,"position",body_ref.global_position,0.2).set_ease(Tween.EASE_OUT)
				print(body_ref.position)
			else:
				tween.tween_property(self,"global_position",initial_pos,0.2).set_ease(Tween.EASE_OUT)
	pass


func _on_area_2d_mouse_entered():
	if not GlobalPass.is_dragging:
		draggable = true
		scale = Vector2(1.05,1.05)
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	if not GlobalPass.is_dragging:
		draggable = false
		scale = Vector2(1,1)
	pass # Replace with function body.

func _on_area_2d_body_entered(body):
	if body.is_in_group('drop'):
		is_inside_dropble = true
		body.modulate = Color(Color.REBECCA_PURPLE,1)
		body_ref = body
		dub = body.duplicate() 
		#print(body.position + Vector2(64,0))
		#GlobalPass._set_global_position(dub,body.position + Vector2(64,0))
		#dub.global_position = body.position + Vector2(64,0)
		dub.position = (body.position - dub.position) + Vector2(64,-1)
		add_child(dub)
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group('drop'):
		is_inside_dropble = false
		body.modulate = Color(Color.MEDIUM_BLUE,0.7)
		if dub != null:
			dub.queue_free()
			dub = null
	pass # Replace with function body.
