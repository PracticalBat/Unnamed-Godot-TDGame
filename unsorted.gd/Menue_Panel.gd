extends Panel

func _on_return_button_pressed() -> void:
	if self.visible:
		self.visible = false
	else: self.visible = true


func _on_main_menue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://unsorted.tscn/haupt_menue.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_home_button_pressed() -> void:
	self.visible = true
