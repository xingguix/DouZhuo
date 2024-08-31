class_name Dou extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var tween: Tween
# Called when the node enters the scene tree for the first time.

@export var collision_enable: bool = false

func start_to_float():
	const float_distance: float = 10
	tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, float_distance), 0.5)
	tween.tween_property(self, "position", position + Vector2(0, -float_distance), 0.5)
	tween.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT_IN)
	tween.set_loops()

func hit(damage: int):
	DouInfo.health -= damage
	audio_stream_player_2d.play()

func stop():
	tween.kill()

func _on_body_entered(body: Node2D) -> void:
	if collision_enable and body is Player:
		body.hit(25)
