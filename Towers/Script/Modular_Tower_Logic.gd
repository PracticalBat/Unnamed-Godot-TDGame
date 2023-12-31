extends Node2D

@export var ray_cast: RayCast2D

var is_in_upgrade_area = false
var upgrade_toggle  = false

var is_fire_ready: bool = true
var built 
@export var type : String = "Tower_5"
@export var collision_shape : CollisionShape2D

var enemy_array: Array = []
var enemy

@export var UpgradeAP : AnimationPlayer

@export_category("front , back , pick_random")
@export var enemy_priority : String = "front"

@export_category("munition type")
@export var munition : PackedScene
@export var munition_spread: String = "direct"
@export var ammount_munition :int = 2
@export_category("damage_type : hitscan, munition, area")
@export var damage_type : String = "hitscan"


var tower_damage = 0
var rate_of_fire = 0
var range = 0
var tower_value = 0

#func _ready() -> void:
	#if built:
		#$Place.emitting = true


func _ready() -> void:
	tower_damage = GameData.tower_data[type]["damage"]
	rate_of_fire = GameData.tower_data[type]["rof"]
	range = GameData.tower_data[type]["range"]
	tower_value = GameData.tower_data[type]["cost"]



func get_tower_type() -> String:
	return type

func _physics_process(_delta) -> void:
	if not get_tree().paused:
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

func aim(atenemy):
	if atenemy != null:
		ray_cast.target_position = to_local(atenemy.position)
	else: 
		print("Enemy == null")
		return 

func fire():
	is_fire_ready = false
	match damage_type:
		"hitscan": enemy.on_hit(tower_damage)
		"munition": for i in ammount_munition:
						_shoot()
						await get_tree().create_timer(0.5).timeout # Tower ROF
	await get_tree().create_timer(rate_of_fire).timeout
	
	is_fire_ready = true

func _shoot() -> void:
	var projectile = munition.instantiate()
	projectile.position = Vector2(0,0)
	projectile.damage = tower_damage
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


func _on_mouse_area_mouse_entered() -> void:
	is_in_upgrade_area = true
	#print("Mouse_Enterd_Tower")


func _on_mouse_area_mouse_exited() -> void:
	is_in_upgrade_area = false
	#print("Mouse_Exited_Tower")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and is_in_upgrade_area == true and built:
			upgrade_toggle = !upgrade_toggle
			print(upgrade_toggle)
			$Upgrade.visible = upgrade_toggle 
			$Upgrade/Range_Overlay.visible = upgrade_toggle
