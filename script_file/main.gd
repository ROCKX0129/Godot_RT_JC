extends Node2D


func _on_quit_game_pressed() -> void:
	get_tree().quit()
	

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/world.tscn")
