extends Node2D

@onready var monster_spowner= $Monster_Spowner
@onready var gameing_music: AudioStreamPlayer2D = $Gameing_music
@onready var game_over_music: AudioStreamPlayer2D = $GameOverMusic
@onready var poro_spown_timer: Timer = $Poro_Spown_Timer
@export var poro_spown:PackedScene


func _ready() -> void:
	GlobalSignal.connect("spirit_dead",Callable(monster_spowner,"spirit_dead"))
	GlobalSignal.connect("snowball_throwed",Callable(monster_spowner,"snowball_throwed"))
	gameing_music.play()
	poro_spown_timer.start()
	game_over_music.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_player_health_depleted() -> void:
	gameing_music.stop()
	$GameOver.visible = true
	get_tree().paused = true
	game_over_music.play()
	await get_tree().create_timer(3.5).timeout
	game_over_music.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scence_file/game_over.tscn")


func _on_poro_spown_timer_timeout() -> void:
	var poro_add = poro_spown.instantiate()
	print("poro spowned")
	add_child(poro_add)
	pass # Replace with function body.
