extends Panel
@onready var label_ime_rastline: Label = $LabelImeRastline
@onready var label_opis_rastline: Label = $LabelOpisRastline
@onready var texture_rect: TextureRect = $TextureRect
@onready var game_manager: Node = $"../../GameManager"
@onready var label_pritisni: Label = $"../LabelPritisni"
@onready var panel_inv: Panel = $"../PanelInv"
@onready var proto_controller: CharacterBody3D = $"../../ProtoController"
@onready var panel_izberi_dn: Panel = $"../PanelIzberiDN"
@onready var panel_rez: Panel = $"../PanelRez"
@onready var label_rez: Label = $"../PanelRez/LabelRez"
@onready var timer_rez: Timer = $"../PanelRez/TimerRez"


var stranOpisa = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	updateOpisRastline()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var poisciRastlino = game_manager.poisciRastlino
	if Input.is_action_just_pressed("R_pressed"):
		toggle()
			
	if self.visible and Input.is_action_just_pressed("ListNaprej"):
		if(stranOpisa == game_manager.poisciRastlino.opisi.size() - 1):
			stranOpisa = 0
		else:
			stranOpisa = stranOpisa+1
		print(stranOpisa)
		texture_rect.texture = game_manager.poisciRastlino.slike[stranOpisa]
		label_opis_rastline.text = game_manager.poisciRastlino.opisi[stranOpisa]
		
	if self.visible and Input.is_action_just_pressed("ListNazaj"):
		print(stranOpisa);
		if(stranOpisa == 0):
			stranOpisa = game_manager.poisciRastlino.opisi.size() -1
		else:
			stranOpisa = stranOpisa - 1;
		print(stranOpisa)
		texture_rect.texture = game_manager.poisciRastlino.slike[stranOpisa]
		label_opis_rastline.text = game_manager.poisciRastlino.opisi[stranOpisa]

			
func updateOpisRastline():
	label_ime_rastline.text = str(game_manager.poisciRastlino.ime)
	print(game_manager.poisciRastlino.ime)
	print(stranOpisa)
	label_opis_rastline.text = game_manager.poisciRastlino.opisi[stranOpisa]
	texture_rect.texture = game_manager.poisciRastlino.slike[stranOpisa]

func _on_button_opis_pressed() -> void:
	toggle()
				
func toggle():
	if panel_izberi_dn.visible:
		label_rez.text = "X"
		panel_rez.visible = true
		timer_rez.start()
		await timer_rez.timeout
		panel_rez.visible = false
	else:
		if self.visible:
				self.visible = false
		else:
			self.visible = true
			panel_inv.visible = false
			if label_pritisni.visible:
					label_pritisni.visible = false
	
