extends ParallaxBackground

onready var material = $ParallaxLayer/TextureRect.material

export var shader_direction : Vector2 = Vector2(0.0, 1.0)

func _ready() -> void:
	change_direction(shader_direction)

func change_direction( new_dir : Vector2 ) -> void:
	material.set_shader_param("Direction", new_dir)
