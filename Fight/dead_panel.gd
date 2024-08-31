extends Panel

func dead() -> void:
	show()

func _on_to_title_pressed() -> void:
	DouInfo.health = 100
	get_tree().change_scene_to_file("res://Menu/control.tscn")
