class_name Hacker extends Node2D
@onready var voice_player: VoicePlayer = $VoicePlayer
@onready var trailer = $Trailer

func move(where: Vector2, time: float):
	var tween = create_tween().tween_property(self, "position", where, time)
	tween.set_ease(Tween.EASE_IN)
	await tween.finished

func play_voice(file_name: String):
	await voice_player.play_voice(file_name)
	return

func set_active(active: bool):
	trailer.speed_scale = active if 1 else 0
