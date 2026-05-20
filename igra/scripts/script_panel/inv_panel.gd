extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("I_pressed"):
		if self.visible == false:
			self.visible = true
		else:
			self.visible = false
