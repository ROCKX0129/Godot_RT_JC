extends CharacterBody2D

class_name Player
@onready var play_Ani = $Player_Ani
const SPEED = 200
@onready var map_layer: TileMapLayer = $"../MapLayer"

signal health_depleted

var health = 100

func _ready() -> void:
	add_to_group("Player")
	pass

func _physics_process(_delta: float) -> void:
	
	
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
	get_tile_map_data()
	move_and_slide()
	

func get_tile_map_data():
	var player_coordinate = map_layer.local_to_map(self.position)
	var cell_data = map_layer.get_cell_tile_data(player_coordinate)
	if cell_data:
		var Slow_speed = cell_data.get_custom_data("Slow_speed")
		print(Slow_speed)
	else:
		return 0



func take_damage(amount: int) -> void:
	health -= amount  # Vähennetään pelaajan terveyttä
	%ProgressBar.value = health
	if health <= 0:
		die()  # Pelaaja kuolee, jos terveys menee nollaan

# Funktio, joka käsittelee pelaajan kuoleman
func die():
	health_depleted.emit()
	
	
