extends Area2D

class_name Snowball


@export var speed = 5
var direction :=Vector2.ZERO
@onready var bullet_kiiler_timer: Timer = $Bullet_kiilerTimer
@onready var snowball_ani: AnimatedSprite2D = $Snowball_ani

func _ready() -> void:
	snowball_ani.play()
	bullet_kiiler_timer.start()
	

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var veloctiy = direction*speed
		
		global_position += veloctiy

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()
	pass
	
	

func _on_bullet_kiiler_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Jos osuu pelaajaan
		body.player_take_damage(3)  # Vähennetään pelaajan terveyttä
		queue_free()
	pass # Replace with function body.
