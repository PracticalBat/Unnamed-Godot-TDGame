extends Control

func _on_menue_button_pressed():
	#_on_pause_play_pressed()
	if self.visible:
		self.visible = false
	else: self.visible = true

func _on_exit_pressed():
	get_tree().quit()

func _on_hauptmenue_pressed():
	get_tree().change_scene_to_file("res://unsorted.tscn/haupt_menue.tscn")


func _on_pause_play_pressed():
	var root = $"../../.." 
	if root.build_mode:
		root.cancel_build_mode()
	if root.paused:
		root.paused = false 
	else:
		root.paused = true
#func _on_pause_play_pressed():
	#var AA = $"../../.."
	#if AA.build_mode:
		#AA.cancel_build_mode()
	#if AA.paused:
		#AA.paused = false 
	#else:
		#AA.paused = true
