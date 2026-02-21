extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_uvod_go_pressed() -> void:
	self.visible = false
