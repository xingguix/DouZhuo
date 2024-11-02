extends ProgressBar


func _process(delta: float) -> void:
	value = 100 - Info.dou_health
