extends Panel
@onready var panel_opis_rastline: Panel = $"../PanelOpisRastline"
@onready var label_pritisni: Label = $"../LabelPritisni"

const GRID_CONTAINER_INV = preload("uid://d1rulweltkent")

var vseCelice: Array[Panel] = []
var stran: GridContainer
var strani: Array[GridContainer]
var i = 0
var trenutnaStran: GridContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	stran = GRID_CONTAINER_INV.instantiate()
	trenutnaStran = stran
	strani.append(stran)
	self.add_child(stran)
	prikazi_stran()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("I_pressed"):
		toggle()
	if self.visible and Input.is_action_just_pressed("ListNaprej"):
		listajNaprej()
	if self.visible and Input.is_action_just_pressed("ListNazaj"):
		listajNazaj()

func _on_button_inv_pressed() -> void:
	toggle()

func _on_button_zapri_inv_pressed() -> void:
	toggle()
		
func toggle():
	if self.visible == false:
		panel_opis_rastline.visible = false
		if label_pritisni.visible:
			label_pritisni.visible = false
		trenutnaStran = strani[0]
		prikazi_stran()
		self.visible = true
	else:
		self.visible = false
		i = 0
		
func dodaj_celico(celica: Panel):
	# po potrebi ustvari novo stran
	if stran.get_child_count() == 6:
		stran = GRID_CONTAINER_INV.instantiate()
		strani.append(stran)
		self.add_child(stran)
		prikazi_stran()
	#dodaj na stran
	stran.add_child(celica)
	
func _on_button_inv_desno_pressed() -> void:
	listajNaprej()

func _on_button_inv_levo_pressed() -> void:
	listajNazaj()
	
func listajNaprej():
	if i < strani.size() -1:
		i += 1
	else:
		i = 0
	trenutnaStran = strani[i]
	prikazi_stran()
		
func listajNazaj():
	if i > 0:
		i -= 1
	else:
		i = strani.size() - 1
	trenutnaStran = strani[i]
	prikazi_stran()
	
func prikazi_stran():
	for stran in strani:
		stran.visible = false
	trenutnaStran.visible = true
