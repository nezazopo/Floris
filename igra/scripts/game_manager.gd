extends Node

var tocke = 3
var rastline: Array[Rastlina] = []
var poisciRastlino
var poiskanoBool = false
var indeksRastline = 0
var konec = false
@onready var panel_poisci_rastlino: Panel = $"../PanelPoisciRastlino"
@onready var panel_tocke: Panel = $"../PanelTocke"
@onready var timer: Timer = $"../Timer"


func _ready():
	var rastline_nodes = get_tree().get_nodes_in_group("rastline")
	rastline.assign(rastline_nodes)
	poisciRastlino = rastline[0]
	panel_poisci_rastlino.updatePanel(poisciRastlino)
	if timer != null:
		timer.timeout.connect(on_timer_timeout)
	
func on_timer_timeout():
	konecIgre()
	
func naslednjaRastlina():
	indeksRastline += 1
	if indeksRastline < rastline.size():
		poisciRastlino = rastline[indeksRastline]
		panel_poisci_rastlino.updatePanel(poisciRastlino)
	else:
		konec = true
		print("KONEC rastlin")
		Engine.time_scale = 0.5
		if timer != null:
			timer.start()
	
func odstej(st):
	tocke -= st
	panel_tocke.updateTocke()
	if(tocke < 0):
		Engine.time_scale = 0.5
		if timer != null:
			timer.start()
		
func pristej():
	tocke += 3
	panel_tocke.updateTocke()
	
func umre():
	print("Zaužil si smrtonosno rastlino, igre je konec")
	Engine.time_scale = 0.5
	if timer != null:
		timer.start()
	
func konecIgre():
	Engine.time_scale = 1
	get_tree().call_deferred("reload_current_scene")
	
func poiskano():
	if poiskanoBool == false:
		poiskanoBool = true
	else:
		poiskanoBool = false
