extends Control




func _on_menue_button_pressed():
	if %Menue_Container.visible:
		%Menue_Container.visible = false
	elif  %Menue_Container.visible == false:
		%Menue_Container.visible = true
	


func _on_exit_pressed():
	get_tree().quit()


func _on_hauptmenue_pressed():
	get_tree().change_scene_to_file("res://haupt_menue.tscn")


