extends Control
class_name LevelSelect

@onready var curren_level : LevelIcon = $"1"
var parent_world_selct: Node
var move_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.position = curren_level.global_position

func _input(event):
	if move_tween and move_tween.is_running():
		return

	if event.is_action_pressed("ui_left") and curren_level.next_level_left:
		curren_level = curren_level.next_level_left
		$Sprite2D.flip_h = true
		tween_player()
	if event.is_action_pressed("ui_right") and curren_level.next_level_right:
		curren_level = curren_level.next_level_right
		$Sprite2D.flip_h = false
		tween_player()
	if event.is_action_pressed("ui_up") and curren_level.next_level_up:
		curren_level = curren_level.next_level_up
		tween_player()
	if event.is_action_pressed("ui_down") and curren_level.next_level_down:
		curren_level = curren_level.next_level_down
		tween_player()
		
	if event.is_action_pressed("ui_cancel"):
		get_tree().get_root().add_child(parent_world_selct)
		get_tree().current_scene = parent_world_selct
		get_tree().get_root().remove_child(self)
		
	if event.is_action_pressed("ui_accept"):
		if curren_level.next_scene_path:
			get_tree().change_scene_to_file(curren_level.next_scene_path)

func tween_player():
	$Sprite2D.play("walk")
	print("Tween")
	move_tween = get_tree().create_tween()
	move_tween.tween_property($Sprite2D, "global_position", curren_level.global_position, 3).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	await move_tween.finished
	$Sprite2D.play("default")

