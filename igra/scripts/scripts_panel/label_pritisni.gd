extends Label

@onready var panel_inv: Panel = $"../PanelInv"
@onready var panel_izberi_dn: Panel = $"../PanelIzberiDN"
@onready var panel_opis_rastline: Panel = $"../PanelOpisRastline"
@onready var panel_pomoc: Panel = $"../PanelPomoc"


var speed := 3.0
var t := 0.0

func _ready() -> void:
	self.visible = false
	
func _process(delta):
	t += delta
	modulate.a = 0.5 + 0.5 * sin(t * speed)
	
