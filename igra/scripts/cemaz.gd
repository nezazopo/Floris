extends "res://scripts/rastlina.gd"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _init() -> void:
	ime = "Cemaz"
	strupenost = 0 #0, 1, 2
	video = preload("res://assets/rastline/cemaz/cemaz_animacija.ogv")

func _ready() -> void:
	super._ready()
	
func vrniSliko():
	var slika = preload("res://assets/rastline/cemaz/cemaz.jpg")
	return slika

func vrniOpis():
	var opis = "Čemaž (tudi divji česen, medvedji česen, gozdni česen, kačji lek ali štrkavec; znanstveno ime Allium ursinum) je trajnica z zdravilnimi učinki. Uvrščamo jo v rod lukov. Številna imena, ki se uporabljajo za čemaž, kažejo na razširjeno uporabo v preteklosti, izvirajo pa iz določenih značilnosti rastline (vonj po česnu, rjavi medvedi radi jedo čemaž, listi suličaste oblike ...)"
	return opis
