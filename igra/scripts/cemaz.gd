extends "res://scripts/rastlina.gd"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _init() -> void:
	video = preload("res://assets/rastline/cemaz/cemaz_animacija.ogv")

func _ready() -> void:
	super._ready()
	
func vrniSliko():
	var slika = preload("res://assets/rastline/cemaz/cemaz.jpg")
	return slika

func vrniOpis():
	var opis = opisi[0]
	return opis
