class_name Bear extends Area2D

@export var healing_value: int = 50
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.heal(healing_value)
		queue_free()
