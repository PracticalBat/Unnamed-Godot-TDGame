extends Control

@export_category("Level_Select")
@export_file("*.tscn") var Level_Select



func _on_new_game_pressed():
	get_tree().change_scene_to_file(Level_Select)


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://unsorted.tscn/credits.tscn")


func _on_exit_pressed():
	get_tree().quit()
