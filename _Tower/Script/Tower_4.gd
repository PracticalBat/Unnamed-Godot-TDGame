extends Node2D

# What makes it special :
# Damage scales with enemys within range.
# Shoots funny beam

var fire_ready = true
var type
var enemy_array= []
var built = false 
var enemy
@onready var ray_cast = $RayCast2D
@export var ammo : PackedScene



func _physics_process(delta):
	if enemy_array.size() != 0 and built:
		select_e()
		if fire_ready:
			fire()
	else:
		enemy = null


func aim(enemy):
	#if ray_cast.get_collider() == enemy
	if enemy != null:
		ray_cast.target_position = to_local(enemy.position).normalized()
	else: return
	


func _shoot():
	var bullet = ammo.instantiate()
	bullet.position = Vector2(0,0)
	bullet.direction = (ray_cast.target_position).normalized()
	#print(str(bullet.direction))
	self.add_child(bullet)
	#get_tree().current_scene.add_child(bullet)


func select_e():
	var enemy_progress_array =[]
	for i in enemy_array:
		enemy_progress_array.append(i)
		var target = enemy_progress_array.pick_random()
		var enemy_index = enemy_progress_array.find(target)
		enemy = enemy_array[enemy_index]

func fire():
	fire_ready = false
	aim(enemy)
	_shoot()
	var speedup = 2 * log(enemy_array.size())
	await get_tree().create_timer(GameData.tower_data[type]["rof"]-speedup).timeout
	fire_ready = true



func _on_range_body_entered(body):
	enemy_array.append(body.get_parent())
#	print("entered")
#	print(enemy_array)


func _on_range_body_exited(body):
	enemy_array.erase(body.get_parent())
#	print("exited")
#	print(enemy_array)
