extends Panel
@onready var label_ime_rastline: Label = $LabelImeRastline
@onready var label_opis_rastline: Label = $LabelOpisRastline
@onready var texture_rect: TextureRect = $TextureRect
@onready var game_manager: Node = $"../../GameManager"
@onready var label_pritisni: Label = $"../LabelPritisni"
@onready var panel_inv: Panel = $"../PanelInv"


var stranOpisa = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	updateOpisRastline()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var poisciRastlino = game_manager.poisciRastlino
	if Input.is_action_just_pressed("R_pressed"):
		if self.visible:
			self.visible = false
		else:
			self.visible = true
			panel_inv.visible = false
			if label_pritisni.visible:
				label_pritisni.skrij()
			
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

	
