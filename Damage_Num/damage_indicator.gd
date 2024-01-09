class_name DamageNumber2D
extends Node2D


@onready var Cont = $Container
@onready var label = $Container/Label
@onready var Animation_Player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#label.text = str(4)
	#Animation_Player.play("show_damage")
	#var tween = get_tree().create_tween()
	#var end_pos = Vector2(randf_range(-5, 5), -5) +position
	#var tween_lenght = Animation_Player.get_animation("show_damage").length
	#
	#tween.tween_property(Cont,"position", end_pos ,tween_lenght).from(position)

func set_and_animate(dmg_value, start_pos, height,spread, color):
	label.self_modulate = color 
	label.text = dmg_value
	Animation_Player.play("show_damage")
	var tween = get_tree().create_tween()
	var end_pos = Vector2(randf_range(-spread, spread), -height) +start_pos
	var tween_lenght = Animation_Player.get_animation("show_damage").length
	
	tween.tween_property(Cont,"position", end_pos ,tween_lenght).from(start_pos)
