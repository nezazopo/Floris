extends "res://scripts/rastlina.gd"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func vrniSliko():
	var slika = preload("res://assets/cat.jpg")
	return slika
