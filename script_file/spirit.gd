extends CharacterBody2D

var SPEED = 100
var player= null
@onready var Spirit_pic:Sprite2D = $Spirit_pic
@onready var  Moving_Timer = $Moving_Timer
@onready var Hitting_Box = $Hiiting_Box
var attack :Attack

func location_to_player():
	var player_node = get_tree().get_first_node_in_group("Player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO

func _process(delta: float) -> void:
	var direction = location_to_player()
	velocity = direction*SPEED
	move_and_slide()

	pass # Replace with function body.


func _on_hiiting_box_area_entered(area: Area2D) -> void:
	if area.get_name() == "Doge":
		queue_free()
		pass
	pass # Replace with function body.
