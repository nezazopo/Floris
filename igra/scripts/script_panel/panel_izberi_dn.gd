extends Panel
#gleda, uporabnikovo odločitev glede rastline
signal odgovor_izbran(odgovor: String)
 #Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass

func _on_button_da_pressed() -> void:
	emit_signal("odgovor_izbran", "da")
func _on_button_ne_pressed() -> void:
	emit_signal("odgovor_izbran", "ne")
	
	
