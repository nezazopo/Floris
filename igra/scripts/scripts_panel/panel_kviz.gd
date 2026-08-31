extends Panel
@onready var game_manager: Node = $"../../GameManager"
@onready var label_vprasanje: Label = $LabelVprasanje
@onready var label_odgovor: Label = $Odgovori/Odg1/LabelOdgovor
@onready var label_odgovor2: Label = $Odgovori/Odg2/ButtonB/LabelOdgovor2
@onready var label_odgovor3: Label = $Odgovori/Odg3/ButtonC/LabelOdgovor3
@onready var pravilno: AudioStreamPlayer = $"../../Avdio/Pravilno"
@onready var narobe: AudioStreamPlayer = $"../../Avdio/Narobe"
@onready var pridobitev: AudioStreamPlayer = $"../../Avdio/Pridobitev"

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
		pridobitev.play()
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
			odgovor_a()
		if Input.is_action_just_pressed("B_pressed"):
			odgovor_b()
		if Input.is_action_just_pressed("C_pressed"):
			odgovor_c()
	else:
		pass

func _on_button_a_pressed() -> void:
	odgovor_a()

func _on_button_b_pressed() -> void:
	odgovor_b()

func _on_button_c_pressed() -> void:
	odgovor_c()

func odgovor_a():
	#pravilen odgovor, naslednje vprašanje
	if poisciRastlino.vpr_odg[i].odgovori[0].pravilno:
		pravilno.play()
		naslednje_vprasanje()
	else:
		print("napacen odgovor")
		narobe.play()
		game_manager.odstej(1)
				
func odgovor_b():
	#pravilen odgovor, naslednje vprašanje
	if poisciRastlino.vpr_odg[i].odgovori[1].pravilno:
		pravilno.play()
		naslednje_vprasanje()
	else:
		print("napacen odgovor")
		narobe.play()
		game_manager.odstej(1)

func odgovor_c():
	if poisciRastlino.vpr_odg[i].odgovori[2].pravilno:
		pravilno.play()
		naslednje_vprasanje()
	else:
		print("napacen odgovor")
		narobe.play()
		game_manager.odstej(1)
