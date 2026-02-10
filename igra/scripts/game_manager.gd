extends Node

var tocke = 3
var rastline: Array[Rastlina] = []
var poisciRastlino
var poiskanoBool = false
var indeksRastline = 0
var konec = false
@onready var panel_poisci_rastlino: Panel = $"../PanelPoisciRastlino"
@onready var panel_tocke: Panel = $"../PanelTocke"

func _ready():
	var rastline_nodes = get_tree().get_nodes_in_group("rastline")
	rastline.assign(rastline_nodes)
	print(rastline)
	poisciRastlino = rastline[0]
	print("Poisci " + poisciRastlino.ime)
	
	
func naslednjaRastlina():
	indeksRastline += 1
	if indeksRastline < rastline.size():
		poisciRastlino = rastline[indeksRastline]
		panel_poisci_rastlino.updatePanel(poisciRastlino)
	else:
		konec = true
		print("KONEC rastlin")
		konecIgre()
	
func odstej(st):
	tocke -= st
	panel_tocke.updateTocke()
	if(tocke < 0):
		konecIgre()
	
func pristej():
	tocke += 3
	panel_tocke.updateTocke()
	
func umre():
	print("Zaužil si smrtonosno rastlino, igre je konec")
	konec = true
	Engine.time_scale = 0.5
	konecIgre()
	
func konecIgre():
	get_tree().reload_current_scene()
	
func poiskano():
	if poiskanoBool == false:
		poiskanoBool = true
	else:
		poiskanoBool = false
