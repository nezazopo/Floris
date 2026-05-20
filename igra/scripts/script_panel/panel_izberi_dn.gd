extends Panel
#gleda, uporabnikovo odločitev glede rastline
signal odgovor_izbran(odgovor: String)
 #Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Da"):
		emit_signal("odgovor_izbran", "da")
	if Input.is_action_just_pressed("Ne"):
		emit_signal("odgovor_izbran", "ne")
		
