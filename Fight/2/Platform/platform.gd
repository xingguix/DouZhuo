@tool
class_name TextPlatform extends AnimatableBody2D


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label
@export var text := ""

func _ready() -> void:
	collision_shape_2d.shape = RectangleShape2D.new()

func _physics_process(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	label.text = text
	collision_shape_2d.shape.size.x = label.get_theme_font_size("font_size") * len(label.text)
	collision_shape_2d.shape.size.y = label.get_line_height()
