extends Panel
@onready var game_manager: Node = $"../../GameManager"
@onready var label_vprasanje: Label = $LabelVprasanje
@onready var label_odgovor: Label = $LabelOdgovor
@onready var label_odgovor2: Label = $LabelOdgovor2
@onready var label_odgovor3: Label = $LabelOdgovor3

signal kviz_resen(resen: bool)
var poisciRastlino
var i = 0
var pravilniOdg: Odgovor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	naslednja_rastlina()
	
func naslednje_vprasanje():
	if (i < poisciRastlino.vpr_odg[i].odgovori.size() -1):
		i = i+1
		label_vprasanje.text = poisciRastlino.vpr_odg[i].besedilo
		label_odgovor.text = poisciRastlino.vpr_odg[i].odgovori[0].besedilo
		label_odgovor2.text = poisciRastlino.vpr_odg[i].odgovori[1].besedilo
		label_odgovor3.text = poisciRastlino.vpr_odg[i].odgovori[2].besedilo
	else:
		print("konec vprašanj")
		self.visible = false
		game_manager.pristej(3)
		kviz_resen.emit(true)
		

func naslednja_rastlina():
	poisciRastlino = game_manager.poisciRastlino
	print("trenutnaRastlina ", poisciRastlino)
	label_vprasanje.text = poisciRastlino.vpr_odg[0].besedilo
	label_odgovor.text = poisciRastlino.vpr_odg[0].odgovori[0].besedilo
	label_odgovor2.text = poisciRastlino.vpr_odg[0].odgovori[1].besedilo
	label_odgovor3.text = poisciRastlino.vpr_odg[0].odgovori[2].besedilo
	i = 0
	var j = 0
	while (pravilniOdg == null):
		if(poisciRastlino.vpr_odg[0].odgovori[2].pravilno):
			pravilniOdg = poisciRastlino.vpr_odg[0].odgovori[2]
		j = j+1
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.visible:
		if Input.is_action_just_pressed("A_pressed"):
			#pravilen odgovor, naslednje vprašanje
			if poisciRastlino.vpr_odg[i].odgovori[0].pravilno:
				naslednje_vprasanje()
			else:
				print("napacen odgovor")
				game_manager.odstej(1)
						
		if Input.is_action_just_pressed("B_pressed"):
			#pravilen odgovor, naslednje vprašanje
			if poisciRastlino.vpr_odg[i].odgovori[1].pravilno:
				naslednje_vprasanje()
			else:
				print("napacen odgovor")
				game_manager.odstej(1)
						
			
		if Input.is_action_just_pressed("C_pressed"):
			#pravilen odgovor, naslednje vprašanje
			if poisciRastlino.vpr_odg[i].odgovori[2].pravilno:
				naslednje_vprasanje()
			else:
				print("napacen odgovor")
				game_manager.odstej(1)
	else:
		pass
