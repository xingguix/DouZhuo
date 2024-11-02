extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var music_player: AudioStreamPlayer2D = $MusicPlayer
@onready var dou: Dou = $Dou
@onready var fight_box: Control = $FightBox
@onready var jump_button: TouchScreenButton = $JumpButton
@onready var player: Player = $Player
@onready var health_bar: ProgressBar = $HealthBar

func _ready() -> void:
	player.load_health()
	Info.dou_health = 100
	# 手动更新一下
	animation_player.play("place_earth")
	await animation_player.animation_finished
	jump_button.show()
	music_player.change_to("fight2")
	animation_player.play("place_platform")
	await animation_player.animation_finished
	animation_player.play("fight2_first")
	await fight_box.speak
	dou.hit(20)
	animation_player.play("floor_lava")
	await animation_player.animation_finished
	animation_player.play("fight2_2")
	await animation_player.animation_finished
	if player.is_dead():
		return

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		if animation_player.speed_scale != 1:
			animation_player.speed_scale = 1
		else:
			animation_player.speed_scale = 10
