extends Label

@onready var panel_inv: Panel = $"../PanelInv"
@onready var panel_izberi_dn: Panel = $"../PanelIzberiDN"
@onready var panel_opis_rastline: Panel = $"../PanelOpisRastline"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func prikazi():
	if(!panel_inv.visible && !panel_izberi_dn.visible && !panel_opis_rastline.visible):
		self.visible = true
	
func skrij():
	self.visible = false
