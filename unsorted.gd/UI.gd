extends CanvasLayer

@export_category("Settings")

@export var HealthLabel: Label
@export var Stage_Name : String = "Test"
@export var Stage_Name_Label: Label
@export var WaveLabel: Label

@export var MoneyLable: Label

@export var Pause: TextureButton






func _update_wave_label():
	WaveLabel.text = str(get_parent().current_wave) + " / " + str(get_parent().wave_num)


func _ready() -> void:
	_update_wave_label()
	Stage_Name_Label.text = Stage_Name
	
	


func _process(_delta):
	_update_wave_label() # needs a singal instead (temp)
	update_healthbar_label()
	update_money_label()


func update_healthbar_label():
	HealthLabel.text = str(StageData.health_points)


func update_money_label():
	MoneyLable.text = str(round(StageData.money))


func set_tower_preview(towertype, mouse_position):
	%Click.play()
	var drag_tower = load("res://Towers/"+towertype+".tscn").instantiate()
	drag_tower.set_name("DragTower")
	drag_tower.modulate= Color.SKY_BLUE
	var range_texture = Sprite2D.new()
	range_texture.position = Vector2()
	var scaling = GameData.tower_data[towertype]["range"] / 620
	var texture = load("res://Game_Assets/range_overlay.png")
	range_texture.texture = texture
	range_texture.modulate = Color.GREEN
	range_texture.scale = Vector2(scaling, scaling)
	var control := Control.new()
	control.add_child(drag_tower,true)
	control.add_child(range_texture,true)
	control.position = mouse_position
	control.set_name("TowerPreview")
	add_child(control,true)
#	move_child(get_node("TowerPreview"),0)

func update_tower_preview(new_position, color, zoom ):
	
#region Do NOT Open
	
	#print(str($"../Move_and_Zoom_Camera".get_position())+"\n"+str($"../Move_and_Zoom_Camera/Pivot_Bee".get_position()))
	#
	#print("Mouse POS : " +str(mousePOS))
	#print("CAMERA POS : " +str(GameData.CameraPos))
	#print("POS X : "+ str(get_node("TowerPreview").position.x))
	#print("POS Y : "+ str(get_node("TowerPreview").position.y))
	#print(center*zoom-$"../Move_and_Zoom_Camera/Pivot_Bee".get_position())
	#get_node("TowerPreview").global_position = ((Vector2(568,318)+(position_mouse+zoom*2)-($"../Move_and_Zoom_Camera".get_position()-Vector2(568,318)))-Vector2(568,318))
	#get_node("TowerPreview").global_position =get_viewport().get_mouse_position()#(((Vector2(568,318)+position_mouse-($"../Move_and_Zoom_Camera".get_position()-Vector2(568,318)))-Vector2(568,318))/2)
	#/$"../Move_and_Zoom_Camera".get_position()#!!!!Vector2(500,500)#$"../Move_and_Zoom_Camera".get_position()+$"../Move_and_Zoom_Camera/Pivot_Bee".get_position()
#endregion
	
	
	get_node("TowerPreview").global_position = new_position # needs adjustments
	get_node("TowerPreview").scale = zoom
	if get_node("TowerPreview").modulate != Color(color):
			get_node("TowerPreview").modulate = Color(color)




#function that is being used when activating the pause button
func _on_pause_play_pressed():

	if get_parent().build_mode:
		get_parent().cancel_build_mode()
		%Pause.play()

	if get_tree().paused:
		%Pause.play()
		get_tree().paused = false 

	else:
		%Pause.play()
		get_tree().paused = true



#function that is being used ehen activating the speed up button
#func _on_speed_up_pressed():
	#if get_parent().build_mode:
		#get_parent().cancel_build_mode()
#
	#if Engine.get_time_scale() == 1:
		#Engine.set_time_scale(2)
	#elif  Engine.get_time_scale() == 2:
		#Engine.set_time_scale(10)
	#else:
		#Engine.set_time_scale(1)



func _on_start_game_button_pressed() -> void:
	if get_parent().current_wave == 0:
		%Monster_Scream.play()
		get_parent().current_wave += 1
		get_parent().start_next_wave()
		
	$Start_Game_Button.queue_free()


func _on_money_button_pressed() -> void:
	StageData.money += 50





func _on_speed_up_button_button_down() -> void:
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
	Engine.set_time_scale(10)
	pass # Replace with function body.


func _on_speed_up_button_button_up() -> void:
	Engine.set_time_scale(1)
	pass # Replace with function body.
