extends Camera2D


@export var Speed = 20.0
@export var Zoom_Speed = 40.0
@export var Zoom_Mrgin = 1.0
@export var Zoom_Min = 1.0
@export var Zoom_Max = 2.0

var zoomFactor = 1.0 
var zoomPos = Vector2()
var zooming = false 
var mousePos = Vector2()

func _process(delta: float) -> void:
	
	#print(get_screen_center_position())
	
	var inputX = int(Input.is_action_pressed("ui_right")) -int(Input.is_action_pressed("ui_left"))
	var inputY = int(Input.is_action_pressed("ui_down")) -int(Input.is_action_pressed("ui_up"))
	
	var new_x = clamp(global_position.x, limit_left,limit_right)
	var new_y = clamp(global_position.y, limit_top,limit_bottom)
	
	global_position = Vector2(new_x,new_y)
	
	position.x = lerp(position.x , position.x + inputX * Speed, Speed *delta)
	position.y = lerp(position.y , position.y + inputY * Speed, Speed *delta)
	
	zoom.x = lerp(zoom.x , zoom.x * zoomFactor, Zoom_Speed * delta)
	zoom.y = lerp(zoom.y , zoom.y * zoomFactor, Zoom_Speed * delta)
	
	zoom.x = clamp(zoom.x, Zoom_Min , Zoom_Max)
	zoom.y = clamp(zoom.y, Zoom_Min , Zoom_Max)
	
	if not zooming:
		zoomFactor = 1.0


func _input(event: InputEvent) -> void:
	if abs(zoomPos.x - get_global_mouse_position().x) > Zoom_Mrgin:
		zoomFactor = 1.0 
	if abs(zoomPos.y - get_global_mouse_position().y) > Zoom_Mrgin:
		zoomFactor = 1.0 
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			zooming = true
			if event.is_action("Scroll Down"):
				zoomFactor -= 0.01 * Zoom_Speed
				zoomPos = get_global_mouse_position()
			if event.is_action("Scroll Up"):
				zoomFactor += 0.01 * Zoom_Speed
				zoomPos = get_global_mouse_position()
		else:
			zooming = false


func snap_in_limit():
	#this code only works correctly when "Camera2D.anchor_mode" is Drag Center.
	
	#first we get the viewport size and divide it by 2 to get the viewport's center.
	var viewport_half_x = get_viewport_rect().size.x/2
	var viewport_half_y = get_viewport_rect().size.y/2
	
	#we offset the limits to acount for the viewport size
	var new_limit_left = limit_left+viewport_half_x
	var new_limit_top = limit_top+viewport_half_y
	var new_limit_right = limit_right-viewport_half_x
	var new_limit_bottom = limit_bottom-viewport_half_y
	
	#clamp the Camera2D's position between the new limits.
	var new_x = clamp(global_position.x, new_limit_left*zoomFactor,new_limit_right*zoomFactor)
	var new_y = clamp(global_position.y, new_limit_top*zoomFactor,new_limit_bottom*zoomFactor)
	
	global_position = Vector2(new_x,new_y)
