extends Panel
@onready var label_ime_rastline: Label = $LabelImeRastline
@onready var label_opis_rastline: Label = $LabelOpisRastline
@onready var texture_rect: TextureRect = $TextureRect
@onready var game_manager = %GameManager
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
	if self.visible and Input.is_action_just_pressed("ListNaprej"):
		print("listam naprej")
		print(stranOpisa);
		if(stranOpisa + 1 == game_manager.poisciRastlino.opisi.size()):
			stranOpisa = 0
		else:
			
			stranOpisa = stranOpisa + 1;
		texture_rect.texture = game_manager.poisciRastlino.slike[stranOpisa] 
		label_opis_rastline.text = game_manager.poisciRastlino.opisi[stranOpisa]
		
	if self.visible and Input.is_action_just_pressed("ListNazaj"):
		print("listam nazaj")
		print(stranOpisa);
		if(stranOpisa -1 < 0):
			stranOpisa = game_manager.poisciRastlino.opisi.size() -1
		else:
			stranOpisa = stranOpisa - 1;
		texture_rect.texture = game_manager.poisciRastlino.slike[stranOpisa-1]
		label_opis_rastline.text = game_manager.poisciRastlino.opisi[stranOpisa-1]

			
func updateOpisRastline():
	label_ime_rastline.text = str(game_manager.poisciRastlino.ime)
	print(game_manager.poisciRastlino.ime)
	label_opis_rastline.text = game_manager.poisciRastlino.vrniOpis()
	texture_rect.texture = game_manager.poisciRastlino.vrniSliko()

	
