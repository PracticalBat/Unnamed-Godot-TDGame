extends Area2D
@export var SPEED : float = 300
@export var PIERCE : int = 2
var direction : Vector2


signal Enemy_Hit


func _physics_process(delta):
	position += direction * SPEED * delta

func _on_body_entered(body):#
	body.get_parent().on_hit(5)
	emit_signal("Enemy_Hit")
	destroy()


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Projectile Out Of Bounds")
	destroy()

func destroy():
	queue_free()
