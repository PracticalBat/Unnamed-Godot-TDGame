@tool
extends Control

class_name LevelIcon


@export var level_name: String = "1"

@export_category("Level_Select")
@export_file("*.tscn") var next_scene_path

@export_category("Level_Movement")
@export var next_level_up: LevelIcon
@export var next_level_down: LevelIcon
@export var next_level_left: LevelIcon
@export var next_level_right: LevelIcon


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(level_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$Label.text =str(level_name)

