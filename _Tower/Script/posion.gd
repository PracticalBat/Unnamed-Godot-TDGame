extends Area2D

var direction : Vector2

var hits: int = 0

@export var tick_ammount : int = 20
@export var tick_wait_time: int = 1


func _ready() -> void:
	print(get_parent().get_tower_type)


func _physics_process(delta):
	position += direction * GameData.projectile["poison"]["speed"] * delta

func _on_body_entered(body):
	hits += 1

	var damage = GameData.projectile["poison"]["damage"]
	var pierce = GameData.projectile["poison"]["pierce"]
	#tick_wait_time , tick_ammount , damage
	body.get_parent().poison(tick_wait_time , tick_ammount , damage)

	if pierce < hits:
		destroy()


func _on_visible_on_screen_screen_exited() -> void:
	print("Projectile Out Of Bounds")
	destroy()


func destroy() -> void:
	queue_free()


