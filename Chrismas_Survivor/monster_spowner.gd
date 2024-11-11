extends Node2D

@export var Enemy_Gobling:PackedScene

func _process(delta: float) -> void:
	var Enemy_Gobling_Spown = Enemy_Gobling.instantiate()
	add_child(Enemy_Gobling_Spown)
	
