extends KinematicBody2D


var move: Vector2 = Vector2(0, 0)
var speed: int = 250
onready var player_sprite: AnimatedSprite = $SpritePlayer
	

func _physics_process(delta: float) -> void:
	move = Vector2()
	move.y = Input.get_axis('up_button', 'down_button')
	move.x = Input.get_axis('left_button', 'right_button')
	move = move.normalized()
	move *= speed
	move_and_slide(move)
	if move.length() > 0:
		$SpritePlayer.play()
	else:
		$SpritePlayer.stop()
	if move.x != 0:
		$SpritePlayer.animation = "walk_left_right"
	elif move.y != 0:
		$SpritePlayer.animation = "walk_up_down"
	else:
		$SpritePlayer.stop()
	
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('left_button'):
		player_sprite.flip_h = true
	if Input.is_action_just_pressed('right_button'):
		player_sprite.flip_h = false

	
