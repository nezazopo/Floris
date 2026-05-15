extends Panel

@export var ime: String = ""
@export var ikona: VideoStream = null

@onready var label: Label = $LabelIkona
@onready var video_stream_player: VideoStreamPlayer = $InvVideoStream  # Fixed type!

func _ready() -> void:
	label.text = ime
	if video_stream_player and ikona:
		video_stream_player.stream = ikona
		video_stream_player.autoplay = true
		video_stream_player.loop = true
		video_stream_player.visible = true
		video_stream_player.play()
		video_stream_player.expand = true          # or false, test both
		video_stream_player.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		video_stream_player.size_flags_vertical = Control.SIZE_EXPAND_FILL
		print("Video set for: ", ime)  # debug
	else:
		print("Missing video_player or ikona for: ", ime)
		if video_stream_player:
			video_stream_player.visible = false

# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
