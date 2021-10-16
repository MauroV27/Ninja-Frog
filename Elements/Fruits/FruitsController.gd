extends Node2D

"""
	Controller of fruits collecteds for player
	in current level
"""

var max_fruits_in_level : int
var fruits_collected : int = 0

func _ready() -> void:
	for fruit in get_children():
		if fruit.is_in_group("Fruit"):
			fruit.connect("fruit_collected", self, "update_num_collected_fruits")
			max_fruits_in_level += 1
	
	print("max fruits: ", max_fruits_in_level)


func update_num_collected_fruits() -> void:
	fruits_collected += 1
	
	if fruits_collected >= max_fruits_in_level:
		print("All fruits has collected")
		get_tree().change_scene("res://Levels/Congratulations.tscn")
