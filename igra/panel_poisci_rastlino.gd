extends Panel
@onready var text_poisci_rastlino: Label = %TextPoisciRastlino
@onready var game_manager = %GameManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if game_manager.poisciRastlino!= null:
		text_poisci_rastlino.text = game_manager.poisciRastlino.ime

func updatePanel(r):
	if(r != null):
		text_poisci_rastlino.text = r.ime
