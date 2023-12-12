extends Node2D

@export var speed = 400

var target = position

func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		move()


func move():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", target , 1.0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	$AnimationPlayer.play("move")
	await tween.finished
	$AnimationPlayer.stop()
