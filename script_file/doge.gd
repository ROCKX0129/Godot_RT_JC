extends Area2D

class_name Attack
@onready var Doge_Ani = $Doge_Ani

var Doge_jumped_high = 0
var speed = 4
var Size_speed = 150
var d =0
@onready var player = get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	Doge_Ani.play()
	d += delta
	global_position = Vector2(
	cos(d*speed)*Size_speed,
	sin(d*speed)*Size_speed
	)+player.global_position
	if self.position.x-player.global_position.x <0:
		Doge_Ani.set_flip_h(false)
	else:
		Doge_Ani.set_flip_h(true)
		pass
	
