extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bullet_summon: BulletSummon = $BulletSummon
@onready var player: Player = $Player
@onready var dou: Node2D = $Dou
@onready var fight_box: Control = $FightBox
@onready var health_bar: ProgressBar = $HealthBar
@onready var dead_panel: Panel = $DeadPanel
@export var infinity_mode: bool = false
@onready var music_player: AudioStreamPlayer2D = $MusicPlayer
@onready var color_rect: ColorRect = $ColorRect
@onready var shua_player: AudioStreamPlayer2D = $ShuaPlayer

func level():
	for i in range(5):
		match i:
			0:
				animation_player.play("to_right")
				await animation_player.animation_finished
				animation_player.play("out_to_center")
				await animation_player.animation_finished
			1:
				animation_player.play("double_triplet")
				await animation_player.animation_finished
				animation_player.play("to_left")
				await animation_player.animation_finished
			2:
				bullet_summon.summon_track_bullet(Vector2(0, -800), 4, player)
				await create_tween().tween_interval(5).finished
			3:
				bullet_summon.summon_track_bullet(Vector2(0, -800), 4.5, player)
				animation_player.play("double_triplet")
				await animation_player.animation_finished
			4:
				animation_player.play("double_triplet")
				await animation_player.animation_finished
				animation_player.play("out_to_center")
				await animation_player.animation_finished
		fight_box.show_option()
		await fight_box.speak
		await create_tween().tween_interval(2).finished
	for j in bullet_summon.get_children():
		j.queue_free()
	await create_tween().tween_interval(2).finished
	music_player.stop()
	for i in range(3):
		match i:
			1:
				dou.stop()
				animation_player.play("to_center")
		color_rect.show()
		shua_player.play()
		await create_tween().tween_interval(1).finished
		color_rect.hide()
		await create_tween().tween_interval(0.5).finished
	color_rect.show()
	shua_player.play()
	
	await create_tween().tween_interval(1).finished
	get_tree().change_scene_to_file("res://Fight/2/fight_2.tscn")
	

func infinity():
	var array = ["double_triplet", "out_to_center", "to_left", "to_right"]
	while true:
		var rand = randi_range(0, 4)
		if rand == 4:
			bullet_summon.summon_track_bullet(Vector2(0, 800), randf_range(3.5, 5), player)
			continue
		animation_player.play(array[rand])
		await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Fight/2/fight_2.tscn")

func _ready() -> void:
	dou.start_to_float()
	music_player.change_to("fight1")
	if infinity_mode:
		infinity()
	else:
		level()


func _on_fight_box_speak() -> void:
	dou.hit(20)

func dead():
	dead_panel.dead()
	player.position = Vector2(10000000, 1000000)
	music_player.change_to("dead")

func _on_player_health_changed(health: int) -> void:
	health_bar.value = health
	if health <= 0:
		dead()
