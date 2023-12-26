extends CharacterBody2D

@onready var raycast := $RayCast2D

var _smooth_mouse_pos: Vector2


const inputs = {
	"ui_up" : Vector2.UP,
	"ui_down" : Vector2.DOWN,
	"ui_right" : Vector2.RIGHT,
	"ui_left" : Vector2.LEFT
}

const grid_size = 16 


func _unhandled_input(event):
	for action in inputs.keys():
		if event.is_action_pressed(action):
			move(action)


func move(action):
	var zielort = inputs[action] * grid_size
	raycast.target_position = zielort
	raycast.force_raycast_update()
	position += zielort


