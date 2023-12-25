extends Control

func _on_exit_pressed():
	get_tree().quit()

func _on_hauptmenue_pressed():
	get_tree().change_scene_to_file("res://unsorted.tscn/haupt_menue.tscn")

func _on_fun_button_pressed():
	if self.visible:
		self.visible = false
	else: self.visible = true


func _on_home_button_toggled(toggled_on: bool) -> void:
	if self.visible:
		self.visible = false
	else: self.visible = true
