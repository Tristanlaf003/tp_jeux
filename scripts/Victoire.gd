extends Node2D

func _on_Button_pressed():
	get_tree().reload_current_scene()
	get_tree().change_scene("res://scene/Main.tscn")
