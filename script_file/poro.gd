extends Area2D

@onready var poro_ani: AnimatedSprite2D = $Poro_ani
@onready var player = get_parent().get_node("Player")
var random_high = randi_range(-324,324)

func _ready() -> void:
	global_position.x = player.global_position.x-566
	global_position.y = player.global_position.y+random_high

func _physics_process(delta: float) -> void:
	poro_ani.play()
	global_position.x += 4
	if self.global_position.x >player.global_position.x+600:
		var random_high = randi_range(-324,324)
		global_position.x = player.global_position.x-566
		global_position.y = player.global_position.y+random_high
	if self.global_position.x <player.global_position.x-600:
		pass
			#global_position.x = player.global_position.x-566
			#global_position.y = player.global_position.y+random_high
		
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(1)
	pass # Replace with function body.
