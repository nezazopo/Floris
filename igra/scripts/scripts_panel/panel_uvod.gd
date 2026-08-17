extends Panel
@onready var label_pritisni: Label = $"../LabelPritisni"
@onready var control_pomoc: Control = $"../ControlPomoc"
@onready var panel_opis_rastline: Panel = $"../PanelOpisRastline"
@onready var panel_inv: Panel = $"../PanelInv"
@onready var button_close_pomoc: Button = $"../ButtonClosePomoc"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("E") and self.visible:
		toggle()
	if Input.is_action_just_pressed("P_pressed"):
		toggle()

func _on_button_close_pomoc_pressed() -> void:
	toggle()

func _on_button_pomoc_pressed() -> void:
	toggle()
		
func toggle():
	if self.visible:
		button_close_pomoc.visible = false
		self.visible = false
		control_pomoc.visible = false
	else:
		if panel_inv.visible:
			panel_inv.visible = false
		if panel_opis_rastline:
			panel_opis_rastline.visible = false
		self.visible = true
		button_close_pomoc.visible = true
		control_pomoc.visible = false
	
	
	
