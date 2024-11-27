extends Node2D
@onready var tittile_music_player: AudioStreamPlayer2D = $Tittile_music_player


func _ready() -> void:
	tittile_music_player.play()
	
func _on_quit_game_pressed() -> void:
	get_tree().quit()
	

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scence_file/story.tscn")
