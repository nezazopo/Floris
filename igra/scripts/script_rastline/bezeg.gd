extends "res://scripts/rastlina.gd"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _init() -> void:
	ime = "Bezeg"
	strupenost = 0 #0, 1, 2
	video = preload("res://assets/rastline/cemaz/cemaz_animacija.ogv")

func _ready() -> void:
	super._ready()
	
func _process(_delta: float) -> void:
	pass

func vrniSliko():
	var slika = preload("res://assets/rastline/bezeg/Sambucus_nigra-Busch.jpg")
	return slika

#func vrniLogo()
	#var logo = preload 
	
func vrniOpis():
	var opis = "Za bezeg so značilni pernati listi, plod pa ima trisemensko jagodo. Cvetovi so dvospolni. Združeni so v do 10 cm velike pakobule (navidezne kobule)[1]. Rastlino gojimo, ko je srednje do velik grm ali drobno drevo. Ima plitek koreninski sistem, iz katerega izraščajo koreninski poganjki. Lubje je sivo in rumenkasto rjave barve, površina lubja je pogosto groba oziroma hrapava."
	return opis
