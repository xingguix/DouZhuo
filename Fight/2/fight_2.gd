extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var music_player: AudioStreamPlayer2D = $MusicPlayer
@onready var dou: Dou = $Dou
@onready var fight_box: Control = $FightBox

func _ready() -> void:
	animation_player.play("place_earth")
	await animation_player.animation_finished
	music_player.change_to("fight2")
	animation_player.play("place_platform")
	await animation_player.animation_finished
	animation_player.play("fight2_first")
	await fight_box.speak
	dou.hit(20)
