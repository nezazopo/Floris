extends Panel
@onready var text_tocke: Label = %TextTocke
@onready var game_manager = %GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_tocke.text = "tocke: " + str(game_manager.tocke)

func updateTocke():
	text_tocke.text = "tocke: " + str(game_manager.tocke)
