extends Node2D
@onready var timer: Timer = $Timer
@export var bag_attack:PackedScene

func _ready() -> void:
	timer.start()


func _on_timer_timeout() -> void:
	var bag_attack_spown = bag_attack.instantiate()
	get_parent().add_child(bag_attack_spown)
	pass # Replace with function body.
