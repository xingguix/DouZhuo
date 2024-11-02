class_name Player extends CharacterBody2D


signal health_changed(health: int)

@onready var player_sprite: PlayerSprite = $PlayerSprite

@onready var hit_player: AudioStreamPlayer2D = $HitPlayer
@onready var heal_player: AudioStreamPlayer2D = $HealPlayer

@onready var jump_buffer_timer: Timer = $JumpBufferTimer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") / 10
@export var max_health: int = 100
@export var health: int = 100
var jump_buffer: bool = false
var invincible: bool = false
@export var gravity_scale: float = 0
@export var speed = 600.
@export var jump_height = -1200.


func _physics_process(delta: float) -> void:
	save_health()
	var x_direction := Input.get_axis("left","right")
	var y_direction := Input.get_axis("up","down")
	if is_on_floor():
		jump_buffer = true
		jump_buffer_timer.start()
	if gravity * gravity_scale:
		if not jump_buffer:
			velocity.y += gravity * gravity_scale
		else:
			if Input.is_action_just_pressed("jump"):
				velocity.y += jump_height
				jump_buffer = false
				jump_buffer_timer.stop()
	else:
		if y_direction:
			velocity.y = y_direction * speed
		else:
			velocity.y = move_toward(velocity.y, 0, speed)

	if x_direction:
		velocity.x = x_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func is_dead() -> bool:
	if health <= 0:
		return true
	return false

func stop_jump_buffer():
	jump_buffer = false

func start_invincible(time: float):
	invincible = true
	var tween := create_tween()
	tween.tween_interval(time)
	await tween.finished
	invincible = false

func hit(damage: int, invincible_time: float = 1.5):
	if invincible:
		return
	health -= damage
	emit_signal("health_changed", health)
	hit_player.play()
	player_sprite.hit(invincible_time)
	start_invincible(invincible_time)

func heal(value: int):
	health += value
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)
	heal_player.play()

func save_health():
	Info.player_health = health

func load_health():
	health = Info.player_health
	emit_signal("health_changed", health)
