extends CharacterBody2D

class_name Player
@onready var play_Ani = $Player_Ani
var SPEED = 100
@onready var map_layer: TileMapLayer = $"../MapLayer"
signal health_depleted

enum States {Normal, Slowing}
var state=States.Normal: set = set_state

func _ready() -> void:
	add_to_group("Player")
	pass

func get_tile_map_data():
	var player_coordinate = map_layer.local_to_map(self.position)
	var cell_data = map_layer.get_cell_tile_data(player_coordinate)
	if cell_data:
		var Slow_speed = cell_data.get_custom_data("Slow_speed")
		if Slow_speed == 1:
			set_state(States.Slowing)
#			pass
		else:
			set_state(States.Normal)

func set_state(new_state:int) -> void:
	var previous_state =state
	state = new_state
	
	if previous_state == States.Normal:
		SPEED = 200
		
	if previous_state == States.Slowing:
		SPEED = 100
	pass

func _physics_process(_delta: float) -> void:
	
	get_tile_map_data() #Saa viesti kartasta(jäätä)
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
	




func take_damage(amount: int) -> void:
	Game.playerHP -= amount  # Vähennetään pelaajan terveyttä
	%ProgressBar.value = Game.playerHP
	if Game.playerHP <= 0:
		die()  # Pelaaja kuolee, jos terveys menee nollaan

# Funktio, joka käsittelee pelaajan kuoleman
func die():
	health_depleted.emit()
	
	
