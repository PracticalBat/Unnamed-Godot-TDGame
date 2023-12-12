extends Node2D


func _ready():
	$AnimatedSprite2D.play("default")
	$AudioStreamPlayer.play()
	await $AnimatedSprite2D.animation_finished
	get_tree().change_scene_to_file("res://tscn/title.tscn")
