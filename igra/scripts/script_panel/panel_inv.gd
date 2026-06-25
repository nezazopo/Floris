extends Panel
@onready var panel_opis_rastline: Panel = $"../PanelOpisRastline"
@onready var label_pritisni: Label = $"../LabelPritisni"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("I_pressed"):
		if self.visible == false:
			panel_opis_rastline.visible = false
			if label_pritisni.visible:
				label_pritisni.visible = true
			self.visible = true
		else:
			self.visible = false

func _on_button_inv_pressed() -> void:
	if self.visible == false:
		panel_opis_rastline.visible = false
		if label_pritisni.visible:
			label_pritisni.visible = false
		self.visible = true
	else:
		self.visible = false
