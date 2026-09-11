extends Node

var tocke = 3
var rastline: Array[Rastlina] = []
var trenutnaRastlina = null
var poisciRastlino
var poiskanoBool = false
var indeksRastline = 0
var konec = false

@onready var panel_tocke: Panel = $"../ControlPanel/PanelTocke"
@onready var timer: Timer = $"../Timer"
@onready var panel_konec: Panel = $"../ControlPanel/PanelKonec"
@onready var panel_opis_rastline: Panel = $"../ControlPanel/PanelOpisRastline"
@onready var panel_e: Panel = $"../ControlPanel/PanelE"
@onready var label_pritisni: Label = $"../ControlPanel/LabelPritisni"
@onready var panel_kviz: Panel = $"../ControlPanel/PanelKviz"
@onready var texture_rect_esc: TextureRect = $"../ControlPanel/TextureRectESC"
@onready var panel_poisci_rastlino: Panel = $"../ControlPanel/PanelPoisciRastlino"
@onready var zmaga: AudioStreamPlayer = $"../Avdio/Zmaga"
@onready var poraz: AudioStreamPlayer = $"../Avdio/Poraz"
@onready var ambient: AudioStreamPlayer = $"../Avdio/Ambient"

func _ready():
	if get_tree().paused:
		get_tree().paused = false
		ambient.play()
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
		panel_kviz.naslednja_rastlina()
	else:
		konec = true
		zmaga.play()
		get_tree().paused = true
		panel_konec.prikaziPanel("Zmaga!\n Bi igral ponovno?")
	
func odstej(st): 
	tocke -= st
	panel_tocke.updateTocke()
	if(tocke <= 0):
		get_tree().paused = true
		poraz.play()
		konec = true
		panel_konec.prikaziPanel("Zmanjkalo ti je točk...\n Bi igral ponovno?")
		
func pristej(st):
	tocke += st
	panel_tocke.updateTocke()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("E") and trenutnaRastlina != null and !panel_kviz.visible):
		panel_e.visible = false
		label_pritisni.visible = false
		trenutnaRastlina.prikazi_dn()
