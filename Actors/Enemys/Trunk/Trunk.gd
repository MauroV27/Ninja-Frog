extends KinematicBody2D

var BULLET = preload("res://Actors/Enemys/Trunk/TrunkBullet.tscn")

# Controla as animações do inimigo
onready var anim = $AnimationPlayer
# Controla a direção horizontal do inimigo
onready var rayCast = $Direction
onready var floor_detect = $FloorDetect
onready var player_detec = $PlayerDetect

const SPEED : int = 60
const GRAVITY : int = 400

enum STATE {IDLE, RUN, ATTACK}

export var detects_cliffs : bool = true
export(int, -1, 1) var direction_fliped : int = -1

var state = STATE.RUN
var motion : Vector2 = Vector2.ZERO
var player : KinematicBody2D 

func _ready() -> void:
	anim.play("Run")
	
	if direction_fliped == 1:
		flip_direction()

func _physics_process(delta: float) -> void:
	
	motion.x = direction_fliped
	motion.y += GRAVITY * delta
	
	if player_detec.is_colliding():
		anim.play("Attack")
		motion.x = 0
	
	if rayCast.is_colliding() or not floor_detect.is_colliding() and detects_cliffs:
		flip_direction()
		floor_detect.position.x = $CollisionShape2D.shape.get_extents().x * direction_fliped
	
	motion = move_and_slide(motion * SPEED, Vector2.UP)


func shooter() -> void:
	var bullet = BULLET.instance()
	bullet.direction = direction_fliped
	bullet.position = $BulletSpawner.position
	add_child(bullet)
	
	if not player_detec.is_colliding():
		anim.play("Run")

func flip_direction() -> void:
	direction_fliped *= -1
	rayCast.cast_to.x *= -1
	rayCast.position.x *= -1
	player_detec.cast_to.x *= -1
	$Sprite.flip_h = not $Sprite.flip_h

func _on_Damage_effect() -> void:
	queue_free()
