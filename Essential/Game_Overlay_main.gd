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

@export var UI: CanvasLayer


@export_category("Code Refrence Nodes")
@export var TowerExclusion: TileMap
@export var Ground: TileMap

@export_category("Path2D")
@export var Path1: Path2D
@export var Path2: Path2D
@export var Path3: Path2D
@export var Path4: Path2D
@export var Path5: Path2D

@export_category("Extra Category")
@export var next_wave_timer: Timer

@export_category("Wave Node")
@export var Stage_Data: Node
var current_wave: int = 0
var wave_num: int = 0


func _ready() -> void:
	GameData.money = Stage_Data.money
	
	wave_num = Stage_Data.get_wave_count()

func _process(_delta):
	GameData.CameraPos = CAMERA.get_position()

	if build_mode:
		update_tower_preview()

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
		7: {
			type = "Ghost_7"
		},
		
		
		
	}
	init_build_mode(Tower[Number].type)




func init_build_mode(type):
	if build_mode:
		cancel_build_mode()
	if GameData.tower_data[type]["cost"] <= GameData.money:
		build_type = type
		build_mode = true
		UI.set_tower_preview(build_type,get_global_mouse_position())
	else : %"loud-incorrect-buzzer-lie-meme-sound-effect".play()

func cancel_build_mode():
	build_mode = false 
	build_valid = false
	get_node("User_interface/TowerPreview").free() #nicht que free , da es zeit braucght wegen if build mode 


func update_tower_preview():
	
	get_viewport().get_mouse_position()
	
	var mouseposition = get_global_mouse_position()
	var current_tile = TowerExclusion.local_to_map(mouseposition)
	var tile_position = TowerExclusion.map_to_local(current_tile) 

	var tile_position2 = TowerExclusion.map_to_local(TowerExclusion.local_to_map(get_viewport().get_mouse_position())) 
	var zoom = CAMERA.get_zoom()

#int get_cell_source_id(layer: int, coords: Vector2i, use_proxies: bool = false) const
#Returns the tile source ID of the cell on layer layer at coordinates coords. Returns -1 if the cell does not exist.
	if TowerExclusion.get_cell_source_id(0, current_tile, false) == -1: # Valid build location check
		UI.update_tower_preview(tile_position2 , Color.CADET_BLUE,zoom)
		build_valid = true 
		build_location = tile_position 
		build_tile = current_tile
		print("Place")
		u_sure = true
	else:
		u_sure = false
		print("No Place")
		UI.update_tower_preview(tile_position2, Color.RED ,zoom)

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
	var wave_data = get_wave_data()
	await get_tree().create_timer(5).timeout
	spawn_en(wave_data)

func spawn_en(wave_data):
	for i in wave_data:
		GameData.enemys_alive += 1
		var enemy = load("res://Enemy/"+i[0]+".tscn").instantiate()

		match i[2]: #Lane match
			1: 
				Path1.add_child(enemy, false)
			2:
				Path2.add_child(enemy, false)
			3: 
				Path3.add_child(enemy, false)
			4: 
				Path4.add_child(enemy, false)
			5: 
				Path5.add_child(enemy, false)
		await get_tree().create_timer(i[1], false).timeout

	print("Enemys alive : = "+str(GameData.enemys_alive))
	next_wave_timer.start()



func _on_next_wave_check_timeout():
	print("DEBUG :next_wave_check timeout")
	if GameData.enemys_alive <= 0: 
		print("DEBUG: Enemys Alive Start Next Wave "+str(GameData.enemys_alive))
		if current_wave >= wave_num:
			print(":::::::::::::::::YOU WON:::::::::::::::::::::")
			pass
		else:
			print("DEBUG : + 50 $ START NEXT WAVE")
			StageData.money += 25
			current_wave += 1
			start_next_wave()
	else: next_wave_timer.start()



