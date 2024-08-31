extends Control

const scene = preload("res://Fight/1/fight.tscn")
const infinity_scene = preload("res://Fight/1/infinity_fight.tscn")

func _on_standard_pressed() -> void:
	get_tree().change_scene_to_packed(scene)


func _on_infinity_pressed() -> void:
	get_tree().change_scene_to_packed(infinity_scene)
