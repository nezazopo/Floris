extends Node

var tocke = 0
var rastline: Array[Rastlina] = []
var poisciRastlino
var poiskanoBool = false
var indeksRastline = 0
var konec = false

func _ready():
	var rastline_nodes = get_tree().get_nodes_in_group("rastline")
	rastline.assign(rastline_nodes)
	poisciRastlino = rastline[0]
	print("Poisci " + poisciRastlino.ime)
	
func naslednjaRastlina():
	indeksRastline += 1
	if indeksRastline < rastline.size():
		poisciRastlino = rastline[indeksRastline]
	else:
		konec = true
		print("KONEC")
	
func odstej(stevilo):
	tocke -= stevilo
	
func pristej():
	tocke += 3
	
func poiskano():
	if poiskanoBool == false:
		poiskanoBool = true
	else:
		poiskanoBool = false
