class_name BulletSummon extends Node2D

const move_bullet_scene: PackedScene = preload("res://Bullet/move_bullet.tscn")
const track_bullet_scene: PackedScene = preload("res://Bullet/track_bullet.tscn")

const default_velocity: float = 10
const TORIGHT := Vector2(default_velocity, 0)
const TOLEFT := Vector2(-default_velocity, 0)
const TOTOP := Vector2(0, default_velocity)
const TOBOTTOM := Vector2(0, -default_velocity)

func play_sound():
	var audio := AudioStreamPlayer2D.new()
	audio.stream = preload("res://Bullet/sound.mp3")
	add_child(audio)
	audio.volume_db = -10
	audio.play()

func summon(bullet_position: Vector2, velocity: Vector2) -> Bullet:
	play_sound()
	var move_bullet := move_bullet_scene.instantiate()
	add_child(move_bullet)
	move_bullet.position = bullet_position
	move_bullet.velocity = velocity
	return move_bullet

func triplet(bullet_position: Vector2, velocity: Vector2, wait_time: float = 0, flip: bool = false):
	for i in range(-150, 151, 150):
		if wait_time:
			var tween = create_tween()
			tween.tween_interval(wait_time)
			await tween.finished
		if flip:
			i *= -1
		
		summon(bullet_position + Vector2(velocity.y/default_velocity * i, velocity.x/default_velocity * i), velocity)

func summon_track_bullet(bullet_position: Vector2, speed: float, target: Node2D):
	var track_bullet = track_bullet_scene.instantiate()
	call_deferred("add_child", track_bullet)
	track_bullet.position = bullet_position
	track_bullet.speed = speed
	track_bullet.target = target
	
