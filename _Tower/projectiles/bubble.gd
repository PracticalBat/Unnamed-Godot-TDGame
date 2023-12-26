extends Area2D

var direction : Vector2

var hits: int = 0

var in_body = false

@export var damage_tick_time: float = 0.1


func _physics_process(delta):
	position += direction * GameData.projectile["bubble"]["speed"] * delta

func _on_body_entered(body):
	in_body = true
	while in_body and body != null:
		var damage = GameData.projectile["bubble"]["damage"]
		body.get_parent().on_hit(damage)
		await get_tree().create_timer(damage_tick_time,false).timeout

func _on_body_exited(_body: Node2D) -> void:
	in_body = false



func _on_visible_on_screen_screen_exited() -> void:
	#print("Projectile Out Of Bounds")
	destroy()


func destroy() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	destroy()


