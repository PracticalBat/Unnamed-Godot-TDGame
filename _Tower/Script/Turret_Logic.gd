extends Node2D
var fire_ready = true
var type
var enemy_array= []
var built = false 
var enemy


func _physics_process(delta):
	if enemy_array.size() != 0 and built:
		select_e()
		if fire_ready:
			fire()
	else:
		enemy = null


func select_e():
	var enemy_progress_array =[]
	for i in enemy_array:
		enemy_progress_array.append(i)
		var max_offset = enemy_progress_array.front()
		var enemy_index = enemy_progress_array.find(max_offset)
		enemy = enemy_array[enemy_index]

func fire():
	fire_ready = false
	enemy.on_hit(GameData.tower_data[type]["damage"])
	await get_tree().create_timer(GameData.tower_data[type]["rof"]).timeout
	fire_ready = true



func _on_range_body_entered(body):
	enemy_array.append(body.get_parent())
#	print("entered")
#	print(enemy_array)


func _on_range_body_exited(body):
	enemy_array.erase(body.get_parent())
#	print("exited")
#	print(enemy_array)
