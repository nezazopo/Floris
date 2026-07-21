extends Panel
#gleda, uporabnikovo odločitev glede rastline
signal odgovor_izbran(odgovor: String)
@onready var proto_controller: CharacterBody3D = $"../../ProtoController"
 

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Ne")):
		emit_signal("odgovor_izbran", "ne")
	if(Input.is_action_just_pressed("Da")):
		emit_signal("odgovor_izbran", "da")
		
	if(self.visible):
		proto_controller.release_mouse()
	pass

func _on_button_da_pressed() -> void:
	emit_signal("odgovor_izbran", "da")
	
func _on_button_ne_pressed() -> void:
	emit_signal("odgovor_izbran", "ne")
	
