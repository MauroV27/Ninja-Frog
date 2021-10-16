extends Area2D

signal effect

func _on_Damage_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		print("Player pulou no tronco")
		emit_signal("effect")
