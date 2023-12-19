extends CanvasLayer



@export_category("Settings")
@export var MoneyLable: Label
@export var Pause: TextureButton
@export var FF: TextureButton


func _process(delta):
	set_money()



func set_tower_preview(towertype, mouse_position):
	%Click.play()
	var drag_tower = load("res://_Tower/"+towertype+".tscn").instantiate()
	drag_tower.set_name("DragTower")
	drag_tower.modulate= Color.GREEN
	var range_texture = Sprite2D.new()
	range_texture.position = Vector2()
	var scaling = GameData.tower_data[towertype]["range"] / 620
	var texture = load("res://Assets/range_overlay.png")
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

func update_tower_preview(new_position, color):
	get_node("TowerPreview").position = new_position
	if get_node("TowerPreview").modulate != Color(color):
			get_node("TowerPreview").modulate = Color(color)
			get_node("TowerPreview/Sprite2D").modulate = Color(color)



#function that is being used ehen activating the pause button
func _on_pause_play_pressed():
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
		%Pause.play()
	if get_tree().paused:
		%Pause.play()
		get_tree().paused = false 
	elif get_parent().current_wave == 0:
		%Monster_Scream.play()
		get_parent().current_wave += 1
		get_parent().start_next_wave()
	else:
		%Pause.play()
		get_tree().paused = true



#function that is being used ehen activating the speed up button
func _on_speed_up_pressed():
	if get_parent().build_mode:
		get_parent().cancel_build_mode()

	if Engine.get_time_scale() == 1:
		Engine.set_time_scale(2)
	elif  Engine.get_time_scale() == 2:
		Engine.set_time_scale(4)
	else:
		Engine.set_time_scale(1)

func set_money():
	MoneyLable.text = str(GameData.money)

