extends Area2D
@onready var stop_timer: Timer = $StopTimer
@onready var m_a_ani: AnimatedSprite2D = $M_a_Ani
@onready var m_a_shape: CollisionShape2D = $M_a_shape

func _ready() -> void:
	stop_timer.start()
	m_a_ani.play("A",1,true)



func _on_stop_timer_timeout() -> void:
	m_a_ani.play("B")
	pass # Replace with function body.





func _on_m_a_ani_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(1)
	pass # Replace with function body.
