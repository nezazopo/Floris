extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible and Input.is_action_just_pressed("ui_accept"):
		visible = false	


func _on_button_uvod_go_pressed() -> void:
	self.visible = false
