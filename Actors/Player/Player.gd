extends KinematicBody2D

const SPEED : int = 100
const GRAVITY : int = 400
const JUMP_FORCE : int = -230

var motion : Vector2 = Vector2.ZERO

onready var anim = $AnimationPlayer

func _physics_process(delta: float) -> void:
	
	motion.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * SPEED
	
	if motion.x != 0:
		$Sprite.flip_h = motion.x < 0
	
	if is_on_floor():
		if Input.get_action_strength("ui_up"):
			motion.y = JUMP_FORCE 
	else:
		motion.y += GRAVITY * delta
	
	animation_controller()
	
	motion = move_and_slide(motion, Vector2.UP)

func animation_controller() -> void:
	if is_on_floor():
		if motion == Vector2.ZERO:
			anim.play("Idle")
		elif motion.x != 0 and motion.y == 0:
			anim.play("Run")
	else:
		if motion.y > 10:
			anim.play("Fall")
		elif motion.y < 0:
			anim.play("Jump")
