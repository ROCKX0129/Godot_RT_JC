extends Sprite2D

var rotate_num = 0.20


func _on_moving_timer_timeout() -> void:
	self.rotation = rotate_num
	rotate_num = -rotate_num
	pass # Replace with function body.
