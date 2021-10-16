extends Area2D

signal fruit_collected

export var sprite_sheet : Texture 
onready var anim = $AnimationPlayer

func _ready() -> void:
	$Sprite.texture = sprite_sheet
	anim.play("idle")

func _on_Fruit_body_entered(body: Node) -> void:
	if body.name == "Player":
		$Collected.visible = true
		anim.play("Colected")

func destroy_fruit() -> void:
	emit_signal("fruit_collected")
	queue_free()
