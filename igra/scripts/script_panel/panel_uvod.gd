extends Panel
@onready var label_pritisni: Label = $"../../LabelPritisni"
@onready var control_uvod: Control = $"../../ControlUvod"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("P_pressed")):
		if self.visible:
			control_uvod.visible = false
			visible = false	
		else:
			self.visible = true
			control_uvod.visible = true

func _on_button_close_uvod_pressed() -> void:
	self.visible = false
	control_uvod.visible = false
	label_pritisni.visible = false

func _on_button_ukazi_pressed() -> void:
	if self.visible:
		self.visible = false
	else:
		self.visible = true
	
