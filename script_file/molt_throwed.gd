extends Node2D
@onready var lanching_timer: Timer = $lanching_timer

@onready var molt_throwed_ani: AnimatedSprite2D = $Molt_throwed_Ani
@export var molt_area:PackedScene
@onready var player = get_parent().get_node("Player")
var random_high = randi_range(-224,224)
var random_weight = randi_range(-476,476)
var player_position:Vector2
var get_random_positon = false
var direction:Vector2
var direction_to_target:Vector2


func random_position():
	if get_random_positon == false:
		player_position = player.global_position
		pass
	return(player_position+Vector2(random_weight,random_high))
	pass

func _physics_process(delta: float) -> void:
	if get_random_positon == false:
		direction=(global_position-random_position()).normalized()
		direction_to_target=(random_position())
		get_random_positon =true
	
	if (direction_to_target-global_position).length()>5:
		global_position -= direction*4
	else:
		lanching_timer.start()
	
	pass


func _on_lanching_timer_timeout() -> void:
	var molt_spown= molt_area.instantiate()
	get_parent().add_child(molt_spown)
	molt_spown.position = self.position
	queue_free()
	pass # Replace with function body.
