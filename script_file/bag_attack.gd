extends Area2D
@onready var bag_ani: AnimatedSprite2D = $Bag_Ani
@onready var bag_shape: CollisionShape2D = $Bag_Shape
@onready var player = get_parent().get_node("Player")

var Ani_playered =0

var original_size = 1
func _ready() -> void:
	bag_ani.play()
	
	
	


func _physics_process(delta: float) -> void:
	rotation_degrees-=3
	self.global_position = player.global_position+Vector2(6,0)
	bag_shape.scale.x+=0.1


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(1)
	pass # Replace with function body.




func _on_bag_ani_animation_finished() -> void:
	if Ani_playered == 1 :
		print(1)
		queue_free()
	if Ani_playered == 0:
		bag_ani.play_backwards()
		bag_shape.scale.x = original_size
		Ani_playered +=1
		pass
		
	pass # Replace with function body.
