extends Label

@onready var panel_inv: Panel = $"../PanelInv"
@onready var panel_izberi_dn: Panel = $"../PanelIzberiDN"
@onready var panel_opis_rastline: Panel = $"../PanelOpisRastline"

@export var amplitude := 10.0
@export var speed := 3.0
var t := 0.0
var start_y := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	start_y = position.y

func _process(delta):
	t += delta
	position.y = start_y + sin(t * speed) * amplitude
	
func prikazi():
	if(!panel_inv.visible && !panel_izberi_dn.visible && !panel_opis_rastline.visible):
		self.visible = true
	
func skrij():
	self.visible = false
