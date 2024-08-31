extends AudioStreamPlayer2D

const dead = preload("res://Music/Dead.ogg")
const fight1 = preload("res://Music/狂妄之人.ogg")


func change_to(what: String):
	stop()
	match what:
		"dead": stream = dead
		"fight1": stream = fight1
		_:
			printerr("Music " + what + " does not exist!")
			return
	play()


func _on_finished() -> void:
	play()
