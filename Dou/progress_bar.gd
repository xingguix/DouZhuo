extends ProgressBar


func _process(delta: float) -> void:
	value = 100 - DouInfo.health
