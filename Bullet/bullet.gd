class_name Bullet extends Area2D

@export var velocity: Vector2

func move() -> Vector2:
	return position + velocity

func _physics_process(delta: float) -> void:
	var next_position := move()
	look_at(get_parent().to_global(next_position))
	position = next_position
	
	var body_array: Array[Node2D] = get_overlapping_bodies()
	for body in body_array:
		if body is Player:
			body.hit(25)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
