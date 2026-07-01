extends Panel
@onready var panel_death_text: Label = $MarginContainer/PanelDeathText
@onready var proto_controller: CharacterBody3D = $"../../ProtoController"
@onready var panel_ukazi: Panel = $"../PanelUkazi"

func _ready() -> void:
	self.visible = false

func prikaziPanel(razlog):
	proto_controller.release_mouse()
	self.visible = true
	if(panel_death_text != null):
		panel_death_text.text = razlog

func _process(delta: float) -> void:
	if visible and Input.is_action_just_pressed("ui_accept"):
		get_tree().call_deferred("reload_current_scene")	
	
