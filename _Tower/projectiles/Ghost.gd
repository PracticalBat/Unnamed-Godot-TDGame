extends Area2D

var direction : Vector2

var hits: int = 0

func _physics_process(delta):
	position += direction * GameData.projectile["ghost"]["speed"] * delta

func _on_body_entered(body):
	hits += 1
	var damage = GameData.projectile["ghost"]["damage"]
	var pierce = GameData.projectile["ghost"]["pierce"]
	var send_back = GameData.projectile["ghost"]["send_back"]
	var stun_time = GameData.projectile["ghost"]["stun_time"]
	
	body.get_parent().go_home(send_back, damage, stun_time)
	
	if pierce < hits:
		destroy()


func _on_visible_on_screen_screen_exited() -> void:
	#print("Projectile Out Of Bounds")
	destroy()

func destroy() -> void:
	queue_free()




func _on_timer_timeout() -> void:
	destroy()
