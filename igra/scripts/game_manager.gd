extends Node

var tocke = 3
var rastline: Array[Rastlina] = []
var trenutnaRastlina = null
var poisciRastlino
var poiskanoBool = false
var indeksRastline = 0
var konec = false
var inventorij: Array[Rastlina] = []

@onready var panel_poisci_rastlino: Panel = %PanelPoisciRastlino
@onready var panel_tocke: Panel = %PanelTocke
@onready var timer: Timer = %Timer
@onready var panel_konec: Panel = %PanelKonec
@onready var panel_opis_rastline = %PanelOpisRastline

func _ready():
	if get_tree().paused:
		get_tree().paused = false
	var rastline_nodes = get_tree().get_nodes_in_group("rastline")
	print("gm", rastline_nodes)
	rastline.assign(rastline_nodes)
	poisciRastlino = rastline[0]
	panel_poisci_rastlino.updatePanel(poisciRastlino)
	
func naslednjaRastlina():
	inventorij.append(poisciRastlino)
	indeksRastline += 1
	if indeksRastline < rastline.size():
		poisciRastlino = rastline[indeksRastline]
		panel_poisci_rastlino.updatePanel(poisciRastlino)
		panel_opis_rastline.updateOpisRastline()
	else:
		konec = true
		get_tree().paused = true
		panel_konec.prikaziPanel("Zmaga!")
	
func odstej(st):
	tocke -= st
	panel_tocke.updateTocke()
	if(tocke <= 0):
		get_tree().paused = true
		konec = true
		panel_konec.prikaziPanel("Zmanjkalo ti je točk!")
		
func pristej():
	tocke += 3
	panel_tocke.updateTocke()
	
func poiskano():
	if poiskanoBool == false:
		poiskanoBool = true
	else:
		poiskanoBool = false

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("E") and trenutnaRastlina != null):
		trenutnaRastlina.prikazi_dn()
