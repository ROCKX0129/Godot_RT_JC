extends CharacterBody2D

var SPEED = 100
var player= null
@onready var Spirit_pic:Sprite2D = $Spirit_pic
@onready var  Moving_Timer = $Moving_Timer
@onready var Hitting_Box = $Hiiting_Box

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

func take_damage(amount: int) -> void:
	Game.spiritHP -= amount
	if Game.spiritHP <= 0:
		Spirit_die()
			

func Spirit_die():
	var current_position = position
	GlobalSignal.spirit_dead.emit(current_position)
	queue_free()  # Poistetaan pelaaja pelistä


func _on_hiiting_box_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Jos osuu pelaajaan
		body.take_damage(3)  # Vähennetään pelaajan terveyttä
		queue_free()
