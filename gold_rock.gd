extends Control

@export var DecayCounter: int = 10
var target = Vector2(0,0)






func _on_texture_button_pressed():
	if DecayCounter > 0:
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("click")
		%Explosion.position = get_local_mouse_position()
		%Explosion.emitting = true
		GameData.money += 1
		
		DecayCounter -= 1

	elif DecayCounter <= 0: queue_free()
