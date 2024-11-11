extends CharacterBody2D

class_name Player
@onready var play_Ani = $Player_Ani
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	add_to_group("Player")
	pass

func _physics_process(delta: float) -> void:
	
	
	var direction := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	if direction<0:
		play_Ani.set_flip_h(true)
		pass
	if direction>0:
		play_Ani.set_flip_h(false)
		pass
	if direction or y_direction:
		velocity = Vector2(direction * SPEED, y_direction * SPEED)
		play_Ani.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		play_Ani.stop()

	move_and_slide()
