extends "res://scripts/rastlina.gd"

# Called every frame. 'delta' is the elapsed time since the previous frame.

func vrniSliko():
	var slika = preload("res://assets/slikeRastlin/cemaz.jpg")
	return slika

func vrniOpis():
	var opis = "Čemaž (tudi divji česen, medvedji česen, gozdni česen, kačji lek ali štrkavec; znanstveno ime Allium ursinum) je trajnica z zdravilnimi učinki. Uvrščamo jo v rod lukov. Številna imena, ki se uporabljajo za čemaž, kažejo na razširjeno uporabo v preteklosti, izvirajo pa iz določenih značilnosti rastline (vonj po česnu, rjavi medvedi radi jedo čemaž, listi suličaste oblike ...)"
	return opis
