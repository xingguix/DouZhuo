extends Control

signal speak

@onready var speak_area: Panel = $Panel/说

func _on_说_body_entered(body: Node2D) -> void:
	if not speak_area.visible:
		return
	if body is Player:
		emit_signal("speak")
		speak_area.hide()

func show_option():
	speak_area.show()
