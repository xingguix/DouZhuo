class_name PlayerSprite extends AnimatedSprite2D


func hit(time: float) -> void:
	const flash_time: int = 2
	for i in range(0, flash_time):
		play("hit")
		var tween := create_tween()
		tween.tween_interval(time/flash_time/2)
		await tween.finished
		play("default")
		if i != flash_time - 1:
			var tween2 := create_tween()
			tween2.tween_interval(time/flash_time/2)
			await tween2.finished
