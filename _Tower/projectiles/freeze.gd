extends Area2D

var direction : Vector2

var hits: int = 0

var damage = GameData.projectile["freeze"]["damage"]
var pierce = GameData.projectile["freeze"]["pierce"]
var stun_time = GameData.projectile["freeze"]["stun_time"]

func _physics_process(delta):
	position += direction * GameData.projectile["freeze"]["speed"] * delta

func _on_body_entered(body):
	hits += 1
	body.get_parent().freeze(stun_time, damage)
	if pierce < hits:
		destroy()


func _on_visible_on_screen_screen_exited() -> void:
	#print("Projectile Out Of Bounds")
	destroy()

func destroy() -> void:
	queue_free()




func _on_timer_timeout() -> void:
	destroy()
