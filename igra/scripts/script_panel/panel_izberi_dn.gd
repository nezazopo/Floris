extends Panel
#gleda, uporabnikovo odločitev glede rastline
signal odgovor_izbran(odgovor: String)
@onready var proto_controller: CharacterBody3D = $"../../ProtoController"
 #Called every frame. 'delta' is the elapsed time since the previous frame.
@onready var panel_rez: Panel = $"../PanelRez"
@onready var label_rez: Label = $"../PanelRez/LabelRez"


func _process(delta: float) -> void:
	if(self.visible):
		proto_controller.release_mouse()
	pass

func _on_button_da_pressed() -> void:
	emit_signal("odgovor_izbran", "da")
	
func _on_button_ne_pressed() -> void:
	emit_signal("odgovor_izbran", "ne")
	
