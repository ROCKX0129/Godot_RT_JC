extends Sprite2D
@onready var moving_timer: Timer = $Moving_Timer

var rotate_num = 0.20


func _on_moving_timer_timeout() -> void:
	self.rotation = rotate_num
	rotate_num = -rotate_num
	pass # Replace with function body.
