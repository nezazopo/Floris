extends Panel

@onready var game_manager: Node = $"../GameManager"
#@onready var text_poisci_rastlino: Label = $TextPoisciRastlino
@onready var proto_controller: CharacterBody3D = $"../ProtoController"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("panel_poisci_rastlino")
	print("Panel ready")
	
func updatePanel(r):
	if(r != null):
		$TextPoisciRastlino.text = r.ime
