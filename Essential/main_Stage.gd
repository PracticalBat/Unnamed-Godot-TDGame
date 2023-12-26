extends Node2D

# Global var
var build_mode : bool = false 
var build_valid : bool = false
var build_type : String
var build_tile 
var build_location
var u_sure: bool = false


@export var Turret_Container_node : Node2D


@export var CAMERA : Camera2D


@export var Stage_Name : String = "Test"
@export var Stage_Name_Label: Label


@export_category("Code Refrence Nodes")
@export var TowerExclusion: TileMap
@export var Ground: TileMap
@export_category("Path2D")
@export var Path1: Path2D
@export var Path2: Path2D
@export var Path3: Path2D

@export_category("Map")
@onready var MAP

@export_category("Extra Category")
@export var next_wave_timer: Timer
@export var WaveLabel: Label
@export var HealthBar: TextureProgressBar
@export var HealthLabel: Label

@export_category("Wave Settings")
@export var Stage_Data: Node
@export var current_wave: int = 0
@export var wave_num: int = 0


func _ready() -> void:
	GameData.money = Stage_Data.money
	
	Stage_Name_Label.text = Stage_Name
	wave_num = Stage_Data.get_wave_count()
	update_healthbar()
	_update_wave_label()

func _process(_delta):
	GameData.CameraPos = CAMERA.get_position()

	if build_mode:
		update_tower_preview()
	update_healthbar()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_pressed("ui_accept") and build_mode == true and u_sure:
		veryfy_and_build()
		cancel_build_mode()



func _on_tower_button_pressed(Number):
	#Each button sends a custum signal which gets selected here 
	var Tower = {
		1: {
			type = "T_1"
		},
		2: {
			type = "T_2"
		},
		3: {
			type = "Tree_3"
		},
		4: {
			type = "Ice_4"
		},
		5: {
			type = "Flower_5"
		},
		6: {
			type = "Axolotl_6"
		},
		
	}
	init_build_mode(Tower[Number].type)




func init_build_mode(type):
	if build_mode:
		cancel_build_mode()
	if GameData.tower_data[type]["cost"] <= GameData.money:
		build_type = type
		build_mode = true
		get_node("UI").set_tower_preview(build_type,get_local_mouse_position())
	else : %"loud-incorrect-buzzer-lie-meme-sound-effect".play()

func cancel_build_mode():
	build_mode = false 
	build_valid = false
	get_node("UI/TowerPreview").free() #nicht que free , da es zeit braucght wegen if build mode 


func update_tower_preview():
	var mouseposition = get_global_mouse_position()
	var current_tile = TowerExclusion.local_to_map(mouseposition)
	var tile_position = TowerExclusion.map_to_local(current_tile) 
	
	var zoom = CAMERA.get_zoom()
	var Correction = get_local_mouse_position()

#int get_cell_source_id(layer: int, coords: Vector2i, use_proxies: bool = false) const
#Returns the tile source ID of the cell on layer layer at coordinates coords. Returns -1 if the cell does not exist.
	if TowerExclusion.get_cell_source_id(0, current_tile, false) == -1: # Valid build location check
		get_node("UI").update_tower_preview(tile_position, Color.CADET_BLUE,zoom,Correction)
		build_valid = true 
		build_location = tile_position 
		build_tile = current_tile
		print("Place")
		u_sure = true
	else:
		u_sure = false
		print("No Place")
		get_node("UI").update_tower_preview(tile_position, Color.RED,zoom,Correction)

func veryfy_and_build():
	%Bump.play()
	var new_tower = load("res://_Tower/"+build_type+".tscn").instantiate()
	new_tower.position = build_location
	new_tower.built = true
	new_tower.type = build_type
	Turret_Container_node.add_child(new_tower,true)
	TowerExclusion.set_cell(0, build_tile,0,Vector2i(0,0),true)
	GameData.money -= GameData.tower_data[build_type]["cost"]


func get_wave_data():
	var wave_data: Array = Stage_Data.get_wave_data()["Wave_"+str(current_wave)]
	return wave_data

func start_next_wave():
	_update_wave_label()
	var wave_data = get_wave_data()
	await get_tree().create_timer(5).timeout
	spawn_en(wave_data)

func spawn_en(wave_data):
	print("AAAA")
	for i in wave_data:
		#await get_tree().create_timer(0.1, false).timeout
		GameData.enemys_alive += 1
		print("AAAA")
		var enemy = load("res://_Enemy/"+i[0]+".tscn").instantiate()
		print("AAAA")
		match i[2]: #Lane match
			1: 
				Path1.add_child(enemy, true)
				print("AAAA")
			2:
				Path2.add_child(enemy, true)
			3: 
				Path3.add_child(enemy, true)
				
		await get_tree().create_timer(i[1]).timeout
	print("DEBUG: Enemys Alive "+str(GameData.enemys_alive))
	next_wave_timer.start()



#func victory():
	#MAP = "res://maps/map_2.tscn"
	#init_map()


func lose():
	get_tree().quit()


func update_healthbar():
	if GameData.health_points <= 0:
		lose()
	HealthBar.set_value_no_signal(GameData.health_points * 10)
	HealthLabel.text = str(GameData.health_points)

func _update_wave_label():
	WaveLabel.text = str(current_wave) + " / " + str(wave_num)


func _on_next_wave_check_timeout():
	print("DEBUG :next_wave_check timeout")
	if GameData.enemys_alive <= 0: 
		print("DEBUG: Enemys Alive Start Next Wave "+str(GameData.enemys_alive))
		if current_wave >= wave_num:
			print(":::::::::::::::::YOU WON:::::::::::::::::::::")
			pass
		else:
			print("DEBUG : + 50 $ START NEXT WAVE")
			GameData.money += 25
			current_wave += 1
			start_next_wave()
	else: next_wave_timer.start()



