extends KinematicBody2D


var move: Vector2 = Vector2(0, 0)
var speed: int = 250
	

func _physics_process(delta: float) -> void:
	move = Vector2()
	move.y = Input.get_axis('up_button', 'down_button')
	move.x = Input.get_axis('left_button', 'right_button')
	move = move.normalized()
	move *= speed
	print(move_and_slide(move))
