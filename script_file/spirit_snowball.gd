extends CharacterBody2D

var SPEED = 100
var player= null
@onready var Spirit_pic:Sprite2D = $Spirit_Snowball_PIC
@onready var  Moving_Timer = $Spirit_Snowball_PIC/Moving_Timer
@onready var Hitting_Box = $Hiiting_Box
@export var snowball:PackedScene
var player_in_zoom = false
@onready var throwed_timer: Timer = $Throwed_Timer



func location_to_player():
	var player_node = get_tree().get_first_node_in_group("Player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO

func _process(delta: float) -> void:
	var direction = location_to_player()
	velocity = direction*SPEED
	if player_in_zoom == false:
		move_and_slide()

	pass # Replace with function body.

func take_damage(amount: int) -> void:
	Game.spiritHP -= amount
	if Game.spiritHP <= 0:
		Spirit_die()
			

func shoot():
	var snowball_instance = snowball.instantiate()
	var direction = location_to_player()
	var position = self.global_position
	GlobalSignal.snowball_throwed.emit(snowball_instance,position,direction)


func Spirit_die():
	var current_position = position
	GlobalSignal.spirit_dead.emit(current_position)
	queue_free()  # Poistetaan pelaaja pelistä


func _on_hiiting_box_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Jos osuu pelaajaan
		body.player_take_damage(3)  # Vähennetään pelaajan terveyttä
		queue_free()


func _on_outing_zoom_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_zoom=true
		if throwed_timer.is_paused() == true:
			throwed_timer.set_paused(false)
		Moving_Timer.stop()
		
	pass # Replace with function body.


func _on_shooting_zoom_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_zoom = false
		Moving_Timer.start()
		throwed_timer.set_paused(true)
		pass
	pass # Replace with function body.


func _on_throwed_timer_timeout() -> void:
	shoot()
	pass # Replace with function body.
