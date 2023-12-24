extends CharacterBody2D



@export var grid_size : int = 128
var direction : Vector2 = Vector2.ZERO
var can_move : bool = true

func _process(delta : float) -> void:

func _physics_process(delta : float) -> void:
	var move_tween = get_tree().create_tween()
	move_tween.tween_property(self, "global_position", global_position,0.1).set_trans(Tween.TRANS_ELASTIC)

