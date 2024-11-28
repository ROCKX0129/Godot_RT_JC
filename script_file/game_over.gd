extends Node2D

func _on_play_again_pressed() -> void:
	Game.Presents = 0 #Nollaa lahjat
	Game.playerHP = 100 # nollaa HP
	get_tree().change_scene_to_file("res://Scence_file/world.tscn")

func _on_main_menu_pressed() -> void:
	Game.Presents = 0 #Nollaa lahjat
	Game.playerHP = 100 # nollaa HP
	get_tree().change_scene_to_file("res://Scence_file/main.tscn")

func _ready():
	$CanvasLayer/ColorRect/Lahjalaskuri.text = "Presents collected: " + str(Game.Presents)
