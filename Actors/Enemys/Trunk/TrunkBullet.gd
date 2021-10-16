extends Area2D

const SPEED : int = 200
export var direction : int = -1

func _process(delta: float) -> void:
	position.x += direction * delta * SPEED


func _on_TrunkBullet_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
