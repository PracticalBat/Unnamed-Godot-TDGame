extends Node2D

# Global var
var build_mode : bool = false 
var build_valid : bool = false
var build_type : String
var build_tile 
var build_location

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
@export var HealthBar: TextureProgressBar

@export_category("Wave Settings")
@export var Stage_Data: Node
@export var current_wave: int = 0
@export var wave_num: int = 99


func _ready() -> void:
	wave_num = Stage_Data.get_wave_count()
	update_healthbar()

func _process(delta):
	if build_mode:
		update_tower_preview()
	update_healthbar()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_pressed("ui_accept") and build_mode == true:
		veryfy_and_build()
		cancel_build_mode()

func _on_tower_1_pressed():
	var type = "Tower_1"
	init_build_mode(type)

func _on_tower_2_pressed():
	var type = "Tower_2"
	init_build_mode(type)

func _on_tower_3_pressed():
	var type = "Tower_3_Bee"
	init_build_mode(type)


func init_build_mode(type):
	if build_mode:
		cancel_build_mode()
	build_type = type
	build_mode = true
	get_node("UI").set_tower_preview(build_type,get_global_mouse_position())

func cancel_build_mode():
	build_mode = false 
	build_valid = false
	get_node("UI/TowerPreview").free() #nicht que free , da es zeit braucght wegen if build mode 


func update_tower_preview():
	var mouseposition = get_global_mouse_position()
	var current_tile = TowerExclusion.local_to_map(mouseposition)
	var tile_position = TowerExclusion.map_to_local(current_tile) 

#int get_cell_source_id(layer: int, coords: Vector2i, use_proxies: bool = false) const
#Returns the tile source ID of the cell on layer layer at coordinates coords. Returns -1 if the cell does not exist.
	if TowerExclusion.get_cell_source_id(0, current_tile, false) == -1: # Valid build location check
		get_node("UI").update_tower_preview(tile_position, Color.GREEN)
		build_valid = true
		build_location = tile_position
		build_tile = current_tile
	else:
		get_node("UI").update_tower_preview(tile_position, Color.RED)
		build_valid = false 

func veryfy_and_build():
	if GameData.tower_data[build_type]["cost"] <= GameData.money:
		GameData.money -= GameData.tower_data[build_type]["cost"]
		%Bump.play()
		var new_tower = load("res://Tower.tscn/"+build_type+".tscn").instantiate()
		new_tower.position = build_location
		new_tower.built = true
		new_tower.type = build_type
		get_node("Turrets").add_child(new_tower,true)
		TowerExclusion.set_cell(0, build_tile,0,Vector2i(0,0),true)
	else : print("DEBUG: not enought money ")


func get_wave_data():
	var wave_data: Array = Stage_Data.get_wave_data()["Wave_"+str(current_wave)]
	return wave_data

func start_next_wave():
	print("DEBUG : + 25 $ START NEXT WAVE")
	GameData.money += 25
	%Wellen_Lable.text =  str("Wave: "+str(current_wave)+" / "+str(wave_num))
	var wave_data = get_wave_data()
	await get_tree().create_timer(0.2).timeout
	spawn_en(wave_data)

func spawn_en(wave_data):
	for i in wave_data:
		GameData.enemys_alive += 1
		var enemy = load("res://Enemys/"+i[0]+".tscn").instantiate()
		match i[2]: #Lane match
			1: Path1.add_child(enemy, true)
			2: Path2.add_child(enemy, true)
			3: Path3.add_child(enemy, true)
		await get_tree().create_timer(i[1]).timeout
	print("DEBUG: Enemys Alive "+str(GameData.enemys_alive))
	next_wave_timer.start()

func next_wave():
	start_next_wave()
	print(current_wave)
	current_wave += 1


#func victory():
	#MAP = "res://maps/map_2.tscn"
	#init_map()


func lose():
	get_tree().quit()


func update_healthbar():
	if GameData.health_points <= 0:
		lose()
	%HealthBar.set_value_no_signal(GameData.health_points * 10)
	%HealthBarLabel.text = str(GameData.health_points) +" / 10"


func _on_next_wave_check_timeout():
	print("DEBUG :next_wave_check timeout")
	if GameData.enemys_alive <= 0: 
		print("DEBUG: Enemys Alive Start Next Wave "+str(GameData.enemys_alive))
		if current_wave >= wave_num:
			#victory() 
			pass
		else: next_wave()
	else: next_wave_timer.start()
