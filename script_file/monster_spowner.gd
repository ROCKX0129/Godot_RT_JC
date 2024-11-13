extends Node2D
@onready var spown_timer=$Spirit_Timer
@export var Enemy_Gobling:PackedScene
var SPOWN_RADIUS = 350
@onready var player = get_parent().get_node("Player")

func _ready() -> void:
	spown_timer.start()
	pass
	


func _on_spirit_timer_timeout() -> void:
	var player_position = player.global_position
	var random_direction = Vector2.RIGHT.rotated(randi_range(0,TAU))
	var spawn_position = (random_direction*SPOWN_RADIUS) +player_position
	var spirit_spowner = Enemy_Gobling.instantiate()
	get_parent().add_child(spirit_spowner)
	spirit_spowner.global_position = spawn_position
	pass # Replace with function body.
