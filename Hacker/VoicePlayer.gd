extends AudioStreamPlayer2D
class_name VoicePlayer

const res = "res://VoicePlayer/Voices/"

var play_array: Array[String]

func play_voice(file_name: String):
	#var dir: DirAccess = DirAccess.open(res + "/Choose")
	#for i in dir.get_files():
		#print(i)
	# 虽然很奇怪,但导出后没有".mp3"文件,只有".mp3.import",可你正常访问.mp3又能访问得了
	file_name.replace(".mp3", "")
	var file_path = res + file_name + ".mp3"
	if not FileAccess.file_exists(file_path + ".import"):
		push_error("VoicePlayer在播放声音时声音文件不存在：", file_path + ".import")
		return
	var file = load(file_path)
	stream = file
	play()
	await finished
