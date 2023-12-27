extends CheckButton

@export var  Tower_Panel: Panel
@export var  Stats_Panel: Panel

var o_pos_tower 
var o_pos_status 

@onready var move_tween : Tween
@onready var move_tween2 : Tween
var Hidden_Pos

func _ready() -> void:
	o_pos_tower = Tower_Panel.global_position
	o_pos_status = Stats_Panel.global_position
#1136 640

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on: 
		move_tween = get_tree().create_tween()
		move_tween2 = get_tree().create_tween()
		
		move_tween.tween_property(Tower_Panel, "global_position", Vector2(16, 656),2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		move_tween2.tween_property(Stats_Panel, "global_position", Vector2(16, 544),2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		
	else: 
		move_tween = get_tree().create_tween()
		move_tween2 = get_tree().create_tween()
		
		move_tween.tween_property(Tower_Panel, "global_position", o_pos_tower,2).set_trans(Tween.TRANS_EXPO)
		move_tween2.tween_property(Stats_Panel, "global_position", o_pos_status,2).set_trans(Tween.TRANS_EXPO)
