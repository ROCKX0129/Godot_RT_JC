extends Area2D

class_name Attack

var Doge_jumped_high = 0
var speed = 6
var Size_speed = 200
var d =0
@onready var player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	d += delta
	global_position = Vector2(
	cos(d*speed)*Size_speed,
	sin(d*speed)*Size_speed
	)+player.global_position
	
	
	pass
