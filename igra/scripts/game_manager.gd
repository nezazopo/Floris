extends Node

var tocke = 3
var rastline: Array[Rastlina] = []
var trenutnaRastlina = null
var poisciRastlino
var poiskanoBool = false
var indeksRastline = 0
var konec = false

@onready var panel_tocke: Panel = $"../Control/PanelTocke"
@onready var timer: Timer = $"../Timer"
@onready var panel_konec: Panel = $"../Control/PanelKonec"
@onready var panel_opis_rastline: Panel = $"../Control/PanelOpisRastline"
@onready var panel_e: Panel = $"../Control/PanelE"
@onready var label_pritisni: Label = $"../Control/LabelPritisni"
@onready var timer_zakljucek: Timer = $"../TimerZakljucek"
@onready var canvas_layer_uvod: CanvasLayer = $"../Control/CanvasLayerUvod"

@onready var panel_poisci_rastlino: Panel = $"../Control/PanelPoisciRastlino"

func _ready():
	canvas_layer_uvod.layer = -1;
	if get_tree().paused:
		get_tree().paused = false
	var rastline_nodes = get_tree().get_nodes_in_group("rastline")
	rastline.assign(rastline_nodes)
	poisciRastlino = rastline[0]
	panel_poisci_rastlino.updatePanel(poisciRastlino)
	
func naslednjaRastlina():
	if poisciRastlino and poisciRastlino.inv_celica:
		var celica = poisciRastlino.inv_celica
		var video_player = celica.get_node_or_null("InvVideoStream")
		if video_player:
			video_player.visible = true
	indeksRastline += 1
	if indeksRastline < rastline.size():
		poisciRastlino = rastline[indeksRastline]
		panel_poisci_rastlino.updatePanel(poisciRastlino)
		panel_opis_rastline.updateOpisRastline()
	else:
		konec = true
		timer_zakljucek.start()
		await timer_zakljucek.timeout
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
		panel_e.visible = false
		label_pritisni.visible = false
		trenutnaRastlina.prikazi_dn()
