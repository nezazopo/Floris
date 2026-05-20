extends Panel

@onready var game_manager: Node = get_node("../GameManager")
@onready var proto_controller: CharacterBody3D = $"../ProtoController"
@onready var text_poisci_rastlino: Label = $TextPoisciRastlino


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("panel_poisci_rastlino")

func updatePanel(r):
	if(r != null):
		text_poisci_rastlino.text = r.ime
