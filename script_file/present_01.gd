extends Area2D
@onready var timer: Timer = $Timer

var speed_controller = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = location_to_player()
	global_position+=direction*speed_controller
	pass

func location_to_player():
	var player_node = get_tree().get_first_node_in_group("Player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Jos osuu pelaajaan
		queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	speed_controller = 10
	pass # Replace with function body.