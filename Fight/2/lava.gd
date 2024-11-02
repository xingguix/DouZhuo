class_name Lava extends Area2D

@export var damage: int = 10

func _physics_process(delta: float) -> void:
	var bodies := get_overlapping_bodies()
	for body in bodies:
		if body is Player:
			body.hit(damage)
			break
