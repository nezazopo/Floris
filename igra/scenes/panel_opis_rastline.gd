extends Panel
@onready var label_ime_rastline: Label = $LabelImeRastline
@onready var label_opis_rastline: Label = $LabelOpisRastline
@onready var texture_rect: TextureRect = $TextureRect
@onready var game_manager = %GameManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	updateOpisRastline()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("R_pressed"):
		if self.visible:
			self.visible = false
		else:
			self.visible = true

func updateOpisRastline():
	label_ime_rastline.text = str(game_manager.poisciRastlino.ime)
	print(game_manager.poisciRastlino.ime)
	label_opis_rastline.text = game_manager.poisciRastlino.vrniOpis()
	texture_rect.texture = game_manager.poisciRastlino.vrniSliko()
	
	
