extends Node
var is_dragging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _set_global_position(body,position):
	body.get_viewport().set_postion(position)
	pass
