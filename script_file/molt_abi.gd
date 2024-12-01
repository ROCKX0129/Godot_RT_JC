extends Node2D
@onready var molt_timer: Timer = $molt_timer
@export var molt_throwed:PackedScene
@onready var player = get_parent().get_node("Player")

func _on_molt_timer_timeout() -> void:
	var molt_throwed_spown=molt_throwed.instantiate()
	get_parent().add_child(molt_throwed_spown)
	molt_throwed_spown.position=player.global_position
	pass # Replace with function body.
