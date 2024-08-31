class_name TrackBullet extends Bullet

@export var target: Node2D
@export var speed: float = 4

func move() -> Vector2:
	var next_position = position + position.direction_to(get_parent().to_local(target.position)) * speed
	return next_position
