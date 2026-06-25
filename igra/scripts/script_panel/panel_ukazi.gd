extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("P_pressed"):
		if self.visible:
			self.visible = false
		else:
			self.visible = true

func _on_button_ukazi_pressed() -> void:
	if self.visible:
		self.visible = false
	else:
		self.visible = true
