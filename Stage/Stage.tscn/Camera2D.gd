extends Camera2D


const Dead_Zone = 60
const ZoomSpeed = Vector2(1,1)
const MinZoom = Vector2(2, 2)
const MaxZoom = Vector2(1,1)
var Quad = 2

@export var Button_1: TextureButton
@export var Button_2: TextureButton
@export var Button_3: TextureButton
@export var Button_4: TextureButton
@export var Button_Zoom: TextureButton


func _process(delta: float) -> void:
	if zoom != MinZoom:
		offset = Vector2(0,0)
		GameData.Camera_in_Quadrant = 2

func get_quad():
	return Quad

func change_quadrant(Q: int) -> void:
	GameData.Camera_in_Quadrant= Q
	if zoom != MinZoom:
		offset = Vector2(0,0)
		return
	match Q:
		
		1: 
			offset = Vector2(1136,0) /2
			#Button_2.disabled = !Button_2.disabled
			#Button_3.disabled = !Button_3.disabled
			#Button_4.disabled = !Button_4.disabled
			#Button_Zoom.disabled = !Button_Zoom.disabled
		2:
			offset = Vector2(0,0)
			#Button_1.disabled = !Button_1.disabled
			#Button_3.disabled = !Button_3.disabled
			#Button_4.disabled = !Button_4.disabled
			#Button_Zoom.disabled = !Button_Zoom.disabled
		3: 
			offset = Vector2(1136,640) /2
			#Button_2.disabled = !Button_2.disabled
			#Button_1.disabled = !Button_1.disabled
			#Button_4.disabled = !Button_4.disabled
			#Button_Zoom.disabled = !Button_Zoom.disabled
		4:
			offset = Vector2(0,640) /2
			#Button_2.disabled = !Button_2.disabled
			#Button_3.disabled = !Button_3.disabled
			#Button_1.disabled = !Button_1.disabled
			#Button_Zoom.disabled = !Button_Zoom.disabled
	pass


func _on_zoom_pressed() -> void:
	
	if zoom == MinZoom:
		zoom = MaxZoom
	elif zoom == MaxZoom:
		zoom = MinZoom
	
	Button_1.disabled = !Button_1.disabled
	Button_2.disabled = !Button_2.disabled
	Button_3.disabled = !Button_3.disabled
	Button_4.disabled = !Button_4.disabled

