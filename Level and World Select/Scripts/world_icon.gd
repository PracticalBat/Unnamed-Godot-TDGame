@tool
extends Control


@export var world_index: int = 1
@export var text: String = " "
@export var level_select_packed: PackedScene =load ("res://unsorted.tscn/haupt_menue.tscn")
@onready var level_select_scene : LevelSelect = level_select_packed.instantiate()


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$Label.text = text

