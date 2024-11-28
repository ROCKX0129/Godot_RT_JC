extends Area2D
@onready var ani_timer: Timer = $Ani_Timer

var player_went_zone = false
var timer_started = false
var speed_controller = -1

var collecting_zone = 75
#zone of collecting present

func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = location_to_player()
	var direction_length = location_to_player_length().length()
	if direction_length <collecting_zone:
		player_went_zone =true
		if timer_started ==false:
			Start_timer()
			timer_started =true
		pass

	if player_went_zone == true:
		position+=direction*speed_controller

	pass

func Start_timer():
	var in_zone = true
	if in_zone == true:
		ani_timer.start()

func location_to_player():
	var player_node = get_tree().get_first_node_in_group("Player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO

func location_to_player_length():
	var player_node = get_tree().get_first_node_in_group("Player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position)
	return Vector2.ZERO


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Jos osuu pelaajaan
		Game.Presents += 1
		queue_free()



func _on_ani_timer_timeout() -> void:
	speed_controller = 10
	pass # Replace with function body.
