extends Node2D
@onready var timer: Timer = $Timer
@export var foot_step_pic:PackedScene
@onready var player = get_parent().get_node("Player")

func _on_timer_timeout() -> void:
	var player_position = player.global_position
	var foot_step_spown=foot_step_pic.instantiate()
	get_parent().add_child(foot_step_spown)
	foot_step_spown.posítion=player_position
	pass # Replace with function body.
