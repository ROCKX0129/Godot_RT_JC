extends Area2D
@onready var bag_ani: AnimatedSprite2D = $Bag_Ani
@onready var bag_shape: CollisionShape2D = $Bag_Shape
@onready var frist_timer: Timer = $frist_Timer
@onready var end_timer: Timer = $end_Timer


var original_size = 1
func _ready() -> void:
	end_timer.start()
	frist_timer.start()
	bag_ani.play()
	
	
	


func _physics_process(delta: float) -> void:
	bag_shape.scale.x+=0.1


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(1)
	pass # Replace with function body.




func _on_end_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.


func _on_frist_timer_timeout() -> void:
	bag_ani.play_backwards()
	bag_shape.scale.x=original_size
	pass # Replace with function body.
