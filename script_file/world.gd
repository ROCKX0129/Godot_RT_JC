extends Node2D

@onready var monster_spowner= $Monster_Spowner


func _ready() -> void:
	GlobalSignal.connect("spirit_dead",Callable(monster_spowner,"spirit_dead"))

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/main.tscn")
	
func _on_start_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/world.tscn")
