extends Node2D

@export var ray_cast: RayCast2D

var is_fire_ready: bool = true
var built 
@export var type : String = "Tower_5"
@export var collision_shape : CollisionShape2D

var enemy_array: Array = []
var enemy = null

@export_category("front , back , pick_random")
@export var enemy_priority : String = "front"

@export_category("munition type")
@export var munition : PackedScene
@export var munition_spread: String = "direct"
@export var ammount_munition :int = 2
@export_category("damage_type : hitscan, munition, area")
@export var damage_type : String = "hitscan"



func get_tower_type() -> String:
	return type

func _physics_process(delta) -> void:
	if enemy_array.size() != 0 and built:
		if damage_type == "area":
			area()
		if damage_type != "area":
			find_enemy()
			aim(enemy)
			if is_fire_ready:
				fire()
	else:
		enemy = null


func find_enemy() -> void:
	
	var enemys_in_range: Array = []
	var target = null
	
	for i in enemy_array:
		enemys_in_range.append(i)
		
		match enemy_priority:
			"front" : target = enemys_in_range.front()
			"back": target = enemys_in_range.back()
			"pick_random": target = enemys_in_range.pick_random()
			
		var index: int = enemys_in_range.find(target)
		enemy = enemy_array[index]

func area():
	for i in enemy_array:
		enemy_array[enemy_array.find(i)].freeze(1)
		
	pass

func aim(enemy):
	if enemy != null:
		ray_cast.target_position = to_local(enemy.position).normalized()
	else: 
		print("Enemy == null")
		return 

func fire():
	is_fire_ready = false
	match damage_type:
		"hitscan": enemy.on_hit(GameData.tower_data[type]["damage"])
		"munition": for i in ammount_munition:
						_shoot()
						await get_tree().create_timer(0.2).timeout
	await get_tree().create_timer(GameData.tower_data[type]["rof"]).timeout
	
	is_fire_ready = true

func _shoot() -> void:
	var projectile = munition.instantiate()
	projectile.position = Vector2(0,0)
	match munition_spread:
		"direct": projectile.direction = (ray_cast.target_position).normalized()
		
	self.add_child(projectile)



func _on_range_body_entered(body) -> void:
	enemy_array.append(body.get_parent())
#	print("entered")
#	print(enemy_array)


func _on_range_body_exited(body) -> void:
	enemy_array.erase(body.get_parent())
#	print("exited")
#	print(enemy_array)
