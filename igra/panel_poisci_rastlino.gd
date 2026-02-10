extends Panel
@onready var text_poisci_rastlino: Label = %TextPoisciRastlino
@onready var game_manager = %GameManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_poisci_rastlino.text = game_manager.poisciRastlino.ime

func updatePanel(Rastlina):
	if(Rastlina != null):
		text_poisci_rastlino.text = Rastlina.ime
