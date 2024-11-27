extends Node2D

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/world.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/main.tscn")
