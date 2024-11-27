extends Node2D



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/world.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/main.tscn")
