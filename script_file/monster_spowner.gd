extends Node2D
@onready var spown_timer=$Spirit_Timer
@export var Enemy_Gobling:PackedScene
@export var Exp_present:PackedScene
@export var Snowball_Gobling:PackedScene
@onready var spirit_timer_2: Timer = $Spirit_Timer2
var SPOWN_RADIUS = 350
var SPOWN_RADIUS_for_present = 200
@onready var player = get_parent().get_node("Player")
@onready var wait_timer: Timer = $Wait_Timer
@onready var level_timer: Timer = $Level_Timer

func _ready() -> void:
	wait_timer.start()
	spown_timer.start()
	level_timer.start()
	pass
	
func spirit_dead(position):
	var present_spown = Exp_present.instantiate()
	get_parent().add_child(present_spown)
	present_spown.global_position = position
	pass

func snowball_throwed(snowball_instance,position,direction):
	add_child(snowball_instance)
	snowball_instance.global_position = position
	snowball_instance.set_direction(direction)
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


func _on_spirit_timer_2_timeout() -> void:
	var player_position = player.global_position
	var random_direction = Vector2.RIGHT.rotated(randi_range(0,TAU))
	var spawn_position = (random_direction*SPOWN_RADIUS) +player_position
	var snowball_spirit_spowner = Snowball_Gobling.instantiate()
	get_parent().add_child(snowball_spirit_spowner)
	snowball_spirit_spowner.global_position = spawn_position
	pass # Replace with function body.


func _on_wait_timer_timeout() -> void:
	spirit_timer_2.start()
	print("Snowball_Gobling spowned")
	pass # Replace with function body.


func _on_level_timer_timeout() -> void:
	spown_timer.level_changed()
	spirit_timer_2.snowball_spirit_level_changed()
	pass # Replace with function body.
