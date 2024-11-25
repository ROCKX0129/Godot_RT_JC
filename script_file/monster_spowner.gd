extends Node2D
@onready var spown_timer=$Spirit_Timer
@export var Enemy_Gobling:PackedScene
@export var Exp_present:PackedScene
var SPOWN_RADIUS = 350
var SPOWN_RADIUS_for_present = 200
@onready var player = get_parent().get_node("Player")

func _ready() -> void:
	spown_timer.start()
	pass
	
func spirit_dead(position):
	var present_spown = Exp_present.instantiate()
	get_parent().add_child(present_spown)
	present_spown.global_position = position
	pass




func _on_spirit_timer_timeout() -> void:
	var player_position = player.global_position
	var random_direction = Vector2.RIGHT.rotated(randi_range(0,TAU))
	var spawn_position = (random_direction*SPOWN_RADIUS) +player_position
	var spirit_spowner = Enemy_Gobling.instantiate()
	get_parent().add_child(spirit_spowner)
	spirit_spowner.global_position = spawn_position
	
	var random_direction_for_present = Vector2.RIGHT.rotated(randi_range(0,TAU))
	var spawn_position_for_present = (random_direction_for_present*SPOWN_RADIUS_for_present) +player_position
	var present_spown = Exp_present.instantiate()
	get_parent().add_child(present_spown)
	present_spown.global_position = spawn_position_for_present
	
	pass # Replace with function body.
