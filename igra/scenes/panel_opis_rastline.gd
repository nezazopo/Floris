extends Panel
@onready var label_opis_rastline: Label = $LabelOpisRastline
@onready var texture_rect: TextureRect = $TextureRect
@onready var game_manager = %GameManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_opis_rastline.text = str("To je " + game_manager.poisciRastlino.ime)
	texture_rect.texture = game_manager.poisciRastlino.vrniSliko()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.visible = false
	pass

func prikaziPanelOpisRastline():
	self.visible = true
	
func _on_button_pressed() -> void:
	self.visible = false
