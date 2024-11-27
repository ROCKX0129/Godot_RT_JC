extends Node2D

@onready var monster_spowner= $Monster_Spowner


func _ready() -> void:
	GlobalSignal.connect("spirit_dead",Callable(monster_spowner,"spirit_dead"))

func _on_player_health_depleted() -> void:
	$GameOver.visible = true
	get_tree().paused = true
	await get_tree().create_timer(3.5).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scence_file/game_over.tscn")
