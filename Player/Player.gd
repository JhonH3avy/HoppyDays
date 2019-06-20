extends KinematicBody2D

var motion = Vector2(0,0)

export var SPEED : int
export var GRAVITY : int
export var JUMP_SPEED : int
export var BOOST_MULTIPLIER : int = 2

export var WORLD_LIMIT : int = 3000

const UP = Vector2(0, -1)

signal animate

# warning-ignore:unused_argument
func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	motion = move_and_slide(motion, UP)


func jump():	
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpAudioStream.play(0)


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0


func animate():
	emit_signal("animate", motion)


func apply_gravity():
	if (position.y > WORLD_LIMIT):
		get_tree().call_group("GameState", "fall_out")
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = GRAVITY
	else:
		motion.y += GRAVITY
	
	
func hurt():
	position.y -= 10
	motion.y = 0
	yield(get_tree(), "idle_frame")
	motion.y = -1 * JUMP_SPEED 
	$PainAudioStream.play(0)
	
func boost():
	position.y -= 10
	motion.y = 0
	yield(get_tree(), "idle_frame")
	motion.y = -1 * JUMP_SPEED * BOOST_MULTIPLIER
	$JumpAudioStream.play(0)
	