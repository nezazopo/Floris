extends Node

var tocke = 3
var rastline: Array[Rastlina] = []
var poisciRastlino
var poiskanoBool = false
var indeksRastline = 0
var konec = false

@onready var panel_poisci_rastlino: Panel = %PanelPoisciRastlino
@onready var panel_tocke: Panel = %PanelTocke
@onready var timer: Timer = %Timer
@onready var panel_death: Panel = %PanelKonec

func _ready():
	var rastline_nodes = get_tree().get_nodes_in_group("rastline")
	rastline.assign(rastline_nodes)
	poisciRastlino = rastline[0]
	panel_poisci_rastlino.updatePanel(poisciRastlino)
	
func naslednjaRastlina():
	indeksRastline += 1
	if indeksRastline < rastline.size():
		poisciRastlino = rastline[indeksRastline]
		panel_poisci_rastlino.updatePanel(poisciRastlino)
	else:
		panel_death.prikaziPanel("Zmaga!")
	
func odstej(st):
	tocke -= st
	panel_tocke.updateTocke()
	if(tocke < 0):
		panel_death.prikaziPanel("Zmanjkalo ti je točk!")
		
func pristej():
	tocke += 3
	panel_tocke.updateTocke()
	
	
func poiskano():
	if poiskanoBool == false:
		poiskanoBool = true
	else:
		poiskanoBool = false
