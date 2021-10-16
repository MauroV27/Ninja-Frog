extends Control

func _ready() -> void:
	pass

func _on_Button_pressed() -> void:
	get_tree().quit()

func _on_Play_pressed() -> void:
	get_tree().change_scene("res://Levels/level 0.tscn")
