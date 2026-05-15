extends Panel

@export var ime: String = ""
@export var ikona: VideoStream = null

@onready var label: Label = $LabelIkona
@onready var video_stream_player: VideoStreamPlayer = $InvVideoStream  # Fixed type!

func _ready() -> void:
	label.text = ime
	video_stream_player.stream = ikona
	video_stream_player.visible = false   
	video_stream_player.play()

func _process(delta: float) -> void:
	pass
